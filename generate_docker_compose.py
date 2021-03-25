import argparse

from deploy.docker_compose import DockerCompose

ARGUMENT_PROJECT = 'project'
ARGUMENT_IMAGE = 'image'
ARGUMENT_TAG = 'tag'


def get_arguments():
    parser = argparse.ArgumentParser(description='Sends message, video or image to telegram channel')
    parser.add_argument(f'-{ARGUMENT_PROJECT[0]}', f'--{ARGUMENT_PROJECT}', required=True, help='Project name')
    parser.add_argument(f'-{ARGUMENT_IMAGE[0]}', f'--{ARGUMENT_IMAGE}', required=True, help='Docker image path')
    parser.add_argument(f'-{ARGUMENT_TAG[0]}', f'--{ARGUMENT_TAG}', required=True, help='Docker image tag')
    return parser.parse_args()


def run():
    args = get_arguments()
    docker_compose = DockerCompose(project_name=getattr(args, ARGUMENT_PROJECT),
                                   docker_image_name=getattr(args, ARGUMENT_IMAGE),
                                   docker_tag_slug=getattr(args, ARGUMENT_TAG))
    docker_compose.gather_data()
    docker_compose.write_file(name='production.gen')


if __name__ == '__main__':
    run()
