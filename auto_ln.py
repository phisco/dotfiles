#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import os.path as pat


def get_paths(curdir, home, prefix):
    my_dotfiles = [dotfile for dotfile in os.listdir(curdir) if dotfile.startswith(prefix)]
    if len(my_dotfiles) == 0:
        raise
    abs_dotfiles = [[pat.join(curdir, dotfile),
                    pat.join(home, "."+dotfile[3:])] for dotfile in my_dotfiles]
    my_dotfiles = dict(zip(my_dotfiles, abs_dotfiles))
    return my_dotfiles


def check_and_solve_existence(homepa):
    if pat.exists(homepa) or pat.lexists(homepa):
        print("backup " + homepa)
        try:
            os.rename(homepa, homepa + "_backup")
        except OSError:
            print("removing previous backup")
            os.remove(homepa+"_backup")
            os.rename(homepa, homepa + "_backup")


def main(curdir=os.getcwd(), prefix="my_"):
    home = os.environ['HOME']
    try:
        my_dotfiles = get_paths(curdir, home, prefix)
    except:
        print("\nno files with specified prefix '{}' in '{}' \n".format(prefix, curdir))
        raise
    for dotfile in my_dotfiles.keys():
        print("checking " + dotfile)
        cwdpa, homepa = my_dotfiles[dotfile]
        check_and_solve_existence(homepa)
        os.symlink(cwdpa, homepa)
        print("symlinked {} as {}\n".format(cwdpa, homepa))

if __name__ == "__main__":
    dotdir = str(input("Insert directory where dotfiles are, leave blank for cwd:\n"))
    prefix = str(input("""
Insert the prefix you use to save your dotfiles, leave blank for 'my_':
(example: .vimrc stored as my_virmc so prefix is 'my_')
"""))
    dotdir = dotdir if dotdir != '' else os.getcwd()
    prefix = prefix if prefix != '' else 'my_'
    try:
        main(dotdir, prefix)
    except:
        pass
