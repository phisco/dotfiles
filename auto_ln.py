#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
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
        print("no files with specified prefix {} in {} \n", prefix, curdir)
        raise
    for dotfile in my_dotfiles.keys():
        print("checking " + dotfile)
        cwdpa, homepa = my_dotfiles[dotfile]
        check_and_solve_existence(homepa)
        # if pat.exists(homepa) or pat.lexists(homepa):
        #     print("backup " + homepa)
        #     try:
        #         os.rename(homepa, homepa + "_backup")
        #     except OSError:
        #         os.remove(homepa+"_backup")
        #         os.rename(homepa, homepa + "_backup")
        os.symlink(cwdpa, homepa)
        print("")

if __name__ == "__main__":
    print("auto_ln.py [dotdir=if not specified cwd] [prefix=if not specified '_my'] \n")
    dotdir = os.getcwd() if len(sys.argv) < 2 else sys.argv[1]
    prefix = "my_" if len(sys.argv) < 3 else sys.argv[2]
    try:
        main(dotdir, prefix)
    except:
        pass
