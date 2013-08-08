#!/usr/bin/env python

from os import getcwd
from os import listdir
from os.path import isdir
from os.path import isfile
from os.path import join
import sys
from termcolor import colored


BLACKLISTED_FILE_NAMES = []
BLACKLISTED_FILE_EXTS = []
HELP_FLAGS = ['-h', '--help']


def make_relative_path(path):
    """Given a path and the starting path of the command, form a relative path and return it as a string."""
    relative_path = path.replace(STARTING_PATH, ".")
    relative_path += '/'
    return relative_path

def print_output(relative_path, filename, line_number, line, text_to_find):
    """
    Print the relative path, line number in red, and the entire line that the text is found on.
    Color the text that we are searching for in yellow.
    """
    full_path = relative_path + filename
    path_length = len(full_path)

    line = line.strip().split(text_to_find)
    line = colored(text_to_find, 'yellow').join(line)

    num_spaces = 100 - path_length
    print "{0}{1}\t{2}\t{3}".format(full_path, " " * num_spaces, colored(line_number, 'red'), line)

def formatted_options(options):
    """Converts the options from a string into a formatted dictionary."""
    new_options = {}
    for option in options:
        option_text = option.split()
        command, args = option_text[0], option_text[1:]
        new_options[command] = args
    return new_options

def check_extension(filename, extensions):
    """
    Checks to see if the input file has an allowed extension. If there are no allowed extensions,
    then the file is already okay. If there are extensions and the file has no extension, then it
    returns false.
    """
    if not extensions:
        return True
    filename_list = filename.split('.')

    # If the file does not have an extension.
    if len(filename_list) == 1:
        return False

    # In case the file has multiple extensions, we only check the last one.
    return filename_list[-1] in extensions

def search_dir(path):
    """Searches through the current directory and returns a list of subdirectories and a list of files in this directory."""
    files = []
    subdirectories = []
    for f in listdir(path):
        full_path = join(path, f)
        if isfile(full_path):
            files.append([path, f])
        elif isdir(full_path):
            relative_path = f
            subdirectories.append(full_path)
    return subdirectories, files

def search_file(path, f):
    """Looks in the current file searching for the given text."""
    lines = open(join(path, f)).readlines()
    line_number = 1
    for line in lines:
        line = line.rstrip('\n')
        if TEXT_TO_FIND in line:
            relative_path = make_relative_path(path)
            print_output(relative_path, f, line_number, line, TEXT_TO_FIND)
        line_number += 1

def explore(path, options=None):
    """Explore the given path recursing through subdirectories looking for files that match the given criteria."""
    subdirectories, files = search_dir(path)
    for path, f in files:
        if check_extension(f, options.get('ext')):
            search_file(path, f)
    for subdir in subdirectories:
        explore(subdir, options=options)

def help_output():
    output = ['Use ff to find text within files.',
              'Example usage:',
              '',
              '\tff def my_function',
              '',
              'This will find all files starting in the current directory with the given text.',
              'It will also print out the line numbers and it will highlight the text within the line that it is on.',
              '',
              'Some arguments you can provide:',
              '',
              'Extensions, represented by: --ext',
              'Usage:\tff def my_function --ext py',
              'This will only search in files that have the .py extension.',
    ]
    return '\n'.join(output)

if __name__ == '__main__':
    arguments = sys.argv
    if len(arguments) == 1:
        print 'Please enter text to search for or add the flag -h for help.'
        sys.exit(0)

    arguments = ' '.join(arguments[1:])
    options = arguments.split(' --')
    if len(options) == 1:
        if options[0] in HELP_FLAGS:
            print help_output()

            sys.exit(1)

    TEXT_TO_FIND = options.pop(0)
    options = formatted_options(options)
    STARTING_PATH = getcwd()

    if sys.argv[1]:
        explore(STARTING_PATH, options=options)


