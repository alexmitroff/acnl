import yaml


class DockerCompose:
    def __init__(self,
                 postgres_pwd, postgres_usr,
                 database_pwd, database_usr,
                 version='3', project_name='acnl',
                 docker_image_name='acnl', docker_tag_slug='test'
                 ):
        self.version = version
        self.volumes = {}
        self.services = {}

        self.postgres_pwd = postgres_pwd
        self.postgres_usr = postgres_usr

        self.project_db_user = database_usr
        self.project_db_pass = database_pwd

        self.project_name = project_name
        self.docker_image_name = docker_image_name
        self.docker_tag_slug = docker_tag_slug

        self.database_service_name = 'postgres'
        self.project_service_name = 'django'
        self.webserver_service_name = 'nginx'
        self.certbot_service_name = 'certbot'

        self.media_volume_name = f'production_media_files'
        self.static_volume_name = f'production_static_files'
        self.logs_volume_name = 'log_files'
        self.tmp_volume_name = 'tmp_files'

        self.project_storage_path = f'/var/www/django/{self.project_name}_production'
        self.static_files_root_path = f'{self.project_storage_path}/static'
        self.media_files_root_path = f'{self.project_storage_path}/media'
        self.webserver_logs_path = f'{self.project_storage_path}/logs'
        self.tmp_path = '/tmp'

        self.certbot_conf_path = './data/certbot/conf:/etc/letsencrypt'
        self.certbot_www_path = './data/certbot/www:/var/www/certbot'

    def add_volumes(self):
        self.volumes[self.media_volume_name] = None
        self.volumes[self.static_volume_name] = None
        self.volumes[self.logs_volume_name] = None
        self.volumes[self.tmp_volume_name] = None

    def get_volumes(self):
        return {
            self.media_volume_name: self.media_files_root_path,
            self.static_volume_name: self.static_files_root_path,
            self.logs_volume_name: self.webserver_logs_path,
            self.tmp_volume_name: self.tmp_path,
        }

    def get_volumes_list(self):
        volumes = self.get_volumes()
        return [f'{key}:{value}' for key, value in volumes.items()]

    def add_database(self):
        db_volume_name = 'dbdata'
        self.volumes[db_volume_name] = None
        self.services[self.database_service_name] = {
            'image': 'postgres:11',
            'container_name': f'{self.project_name}_{self.database_service_name}',
            'ports': ["54320:5432"],
            'volumes': [f'{db_volume_name}:/var/lib/postgresql/data'],
            'environment': [
                f'POSTGRES_PASSWORD={self.postgres_pwd}',
                f'POSTGRES_USER={self.postgres_usr}',
            ]
        }

    def add_project(self):
        self.services[self.project_service_name] = {
            'image': f'{self.docker_image_name}:{self.docker_tag_slug}',
            'container_name': f'{self.project_name}_{self.project_service_name}_{self.docker_tag_slug}',
            'ports': ['8000:8000'],
            'environment': [
                'DJANGO_SETTINGS_MODULE=acnl.settings.dev',
                'DJANGO_DEBUG=1',
                f'PROJECT_VERSION={self.docker_tag_slug}',
                f'DJANGO_DB_HOST={self.database_service_name}',
                f'DJANGO_DB_NAME={self.project_name}_db',
                f'DJANGO_DB_USER={self.project_db_user}',
                f'DJANGO_DB_PASS={self.project_db_pass}',
                f'STATIC_ROOT_PATH={self.static_files_root_path}/',
                f'MEDIA_ROOT_PATH={self.media_files_root_path}/',
            ],
            'command': 'sh ./deploy/acnl_django/prod-run.sh',
            'volumes': self.get_volumes_list(),
            'depends_on': ['postgres']
        }

    def add_webserver(self):
        self.services[self.webserver_service_name] = {
            'image': f'{self.docker_image_name}:nginx',
            'container_name': f'{self.project_name}_{self.webserver_service_name}',
            'command': "/bin/sh -c 'while :; do sleep 6h & wait $${!}; nginx -s reload; done & nginx -g \"daemon off;\"'",
            'ports': ['80:80', '443:443'],
            'environment': [
                f'LOGS_PATH={self.webserver_logs_path}',
                f'STATIC_ROOT_PATH={self.static_files_root_path}',
                f'MEDIA_ROOT_PATH={self.media_files_root_path}',
            ],
            'volumes': self.get_volumes_list(),
            'depends_on': ['django']
        }
        self.services[self.webserver_service_name]['volumes'].append(self.certbot_conf_path)
        self.services[self.webserver_service_name]['volumes'].append(self.certbot_www_path)

    def add_certbot(self):
        self.services[self.certbot_service_name] = {
            'image': 'certbot/certbot',
            'container_name': f'{self.project_name}_{self.certbot_service_name}',
            'restart': 'unless-stopped',
            'volumes': [
                self.certbot_conf_path,
                self.certbot_www_path,
            ],
            'entrypoint': "/bin/sh -c 'trap exit TERM; while :; do certbot renew; sleep 12h & wait $${!}; done;'",
        }

    def gather_data(self):
        self.add_volumes()
        self.add_database()
        self.add_project()
        self.add_webserver()
        self.add_certbot()

    def render(self):
        data_yaml = yaml.dump({'version': self.version})
        data_yaml += yaml.dump({'volumes': self.volumes})
        data_yaml += yaml.dump({'services': self.services})
        return data_yaml

    def get_inmemory_file(self):
        import io
        return io.StringIO(self.render().replace('null', ''))

    def write_file(self, name='docker-compose', path='.'):
        with open(f'{path}/{name}.yaml', 'w+') as f:
            f.write(self.get_inmemory_file().getvalue())
            f.close()
