from django.core.management.base import BaseCommand

import os

from acnl.settings import BASE_DIR, STAT_DIR
import sass

SCSS_FILE_PREFIX = 'scss'
CSS_FILE_PREFIX = 'gen.css'

SCSS_LIST = (
                   {
                       'source': os.path.join(STAT_DIR, 'acnl-style-framework'),
                       'output': os.path.join(STAT_DIR, 'css'),
                       'filename': 'acnl',
                   },
)


class Command(BaseCommand):
    help = "Compile scss files into css"

    def handle(self, *args, **options):
        print("Compile SCSS...", end="\n\n")

        for scss_path in SCSS_LIST:
            source_path = scss_path['source']
            print(f"Search in {source_path}/")
            source_file = f"{scss_path['filename']}.{SCSS_FILE_PREFIX}"
            if source_file not in os.listdir(source_path):
                print(f'There is not {source_file} in {source_path}.')
            else:
                print(f"{source_file} was found!")
                absolute_source_path = os.path.join(source_path, source_file)
                output_path = scss_path['output']
                if not os.path.exists(output_path):
                    os.makedirs(output_path)
                    print(f"{output_path} was created!")
                output_file = f"{scss_path['filename']}.{CSS_FILE_PREFIX}"
                absolute_output_path = os.path.join(output_path, output_file)
                output_string = sass.compile(
                    filename=absolute_source_path,
                    output_style='compressed'
                )
                with open(absolute_output_path, "w+") as css_file:
                    css_file.write(output_string)
                css_file.close()
                print(f"{absolute_output_path} was generated", end="\n\n")
