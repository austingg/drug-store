# coding: utf-8
import os
import argparse

parser = argparse.ArgumentParser(description="make a quick cmake based c++ project by one click")
parser.add_argument("--project-name", type=str, default="helloworld")
args = parser.parse_args()


def make_project_structure(project_name):
    '''
    make the project file structure
    '''
    if not os.path.exists(project_name):
        os.makedirs(project_name)
    
    src_dir = project_name + '/src'
    include_dir = project_name + '/include'
    if not os.path.exists(src_dir):
        os.makedirs(src_dir)
    if not os.path.exists(include_dir):
        os.makedirs(include_dir)


def add_cmakelists(project_name):
    os.chdir(project_name)
    cmakelist_str = "cmake_minimum_required(VERSION 3.1) \n" \
    "project({0} C CXX ASM) \n" \
    "include_directories() \n" \
    "link_directories() \n" \
    "add_executable({0})".format(project_name)
    
    with open("CMakeLists.txt", 'w') as cmakelist:
        cmakelist.write(cmakelist_str)


def main(args):
    make_project_structure(args.project_name)
    add_cmakelists(args.project_name)


if __name__ == '__main__':
    main(args)
