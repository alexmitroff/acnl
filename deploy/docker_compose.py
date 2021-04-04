import yaml


class DockerCompose:
    def __init__(self, version='3', project_name='acnl',
                 docker_image_name='acnl', docker_tag_slug='test'):
        self.version = version
        self.volumes = {}
        self.services = {}

        self.project_name = project_name
        self.docker_image_name = docker_image_name
        self.docker_tag_slug = docker_tag_slug

        self.database_service_name = 'postgres'
        self.project_service_name = 'django'
        self.webserver_service_name = 'nginx'

    def add_database(self):
        db_volume_name = 'dbdata'
        self.volumes[db_volume_name] = None
        self.services[self.database_service_name] = {
            'image': 'postgres:11',
            'container_name': f'{self.project_name}_{self.database_service_name}',
            'ports': ["54320:5432"],
            'volumes': [f'{db_volume_name}: /var/lib/postgresql/data']
        }

    def add_project(self):
        media_volume_name = f'{self.docker_tag_slug}_media_files'
        static_volume_name = f'{self.docker_tag_slug}_static_files'
        logs_volume_name = 'log_files'
        self.volumes[media_volume_name] = None
        self.volumes[static_volume_name] = None
        self.volumes[logs_volume_name] = None
        self.services[self.project_service_name] = {
            'image': f'{self.docker_image_name}:{self.docker_tag_slug}',
            'container_name': f'{self.project_name}_{self.project_service_name}_{self.docker_tag_slug}',
            'ports': ['8000:8000'],
            'volumes': [
                f'{media_volume_name}: /var/www/django/{self.project_name}/media',
                f'{static_volume_name}: /var/www/django/{self.project_name}/static',
                f'{logs_volume_name}: /var/www/django/{self.project_name}/logs',
            ],
            'depends_on': ['postgres']
        }

    def add_webserver(self):
        media_volume_name = f'{self.docker_tag_slug}_media_files'
        static_volume_name = f'{self.docker_tag_slug}_static_files'
        logs_volume_name = 'log_files'
        self.volumes[media_volume_name] = None
        self.volumes[static_volume_name] = None
        self.volumes[logs_volume_name] = None
        self.services[self.webserver_service_name] = {
            'image': f'{self.docker_image_name}:nginx',
            'container_name': f'{self.project_name}_{self.webserver_service_name}',
            'ports': ['80:80'],
            'volumes': [
                f'{media_volume_name}: /var/www/django/{self.project_name}/media',
                f'{static_volume_name}: /var/www/django/{self.project_name}/static',
                f'{logs_volume_name}: /var/www/django/{self.project_name}/logs',
            ],
            'depends_on': ['django']
        }

    def gather_data(self):
        self.add_database()
        self.add_project()
        self.add_webserver()

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
