# Import sass compile lib
import os

import sass
from django.core.management.base import BaseCommand

from acnl.settings import STAT_DIR

INPUT_DIR = "sass"
OUTPUT_DIR = "css"

STYLE_FILES = [
    {'filename': 'acnl', 'app': 'encyclopedia'}
]

SASS_FILE_PREFIX = 'scss'
CSS_FILE_PREFIX = 'gen.css'


class Command(BaseCommand):
    help = "Compile scss files into css"

    def handle(self, *args, **options):
        print(f"## Compile SASS script started ##".upper(), end="\n\n")
        # Get main.scss
        for style_file in STYLE_FILES:
            print(f"## {style_file['filename']} file ##".upper())
            path = STAT_DIR
            print(f"Searching sass directory in {path}")
            if not INPUT_DIR in os.listdir(path):
                print(f"There is not {INPUT_DIR} directory.\n Do nothing")
            else:
                print("Sass directory was found!")
                input_path = os.path.join(path, INPUT_DIR)
                sass_filename = ".".join([style_file['filename'], SASS_FILE_PREFIX])
                if not sass_filename in os.listdir(input_path):
                    print(f"There is not {sass_filename}.\n Do nothing")
                else:
                    print(f"{sass_filename} was found!")
                    input_abspath = os.path.join(input_path, sass_filename)

                    # Create css dir if it doesn't exist
                    output_dir = os.path.join(path, OUTPUT_DIR)
                    if not os.path.exists(output_dir):
                        os.makedirs(os.path.join(path, OUTPUT_DIR))

                    css_filename = ".".join([style_file['filename'], CSS_FILE_PREFIX])
                    output_abspath = os.path.join(output_dir, css_filename)
                    output_string = sass.compile(
                            filename=(input_abspath),
                            output_style='compressed'
                            )
                    with open(output_abspath, "w+") as css_file:
                        css_file.write(output_string)
                    css_file.close()
                    print(f"CSS file generated: {output_abspath}", end="\n\n")