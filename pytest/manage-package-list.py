#!/usr/bin/env nix-shell
#! nix-shell -p python3 python3Packages.pip -i python

import subprocess


def search_packages():
    cmd = "pip search pytest | cut -f 1 -d ' ' | sort"
    proc_result = subprocess.run(
        cmd, shell=True, stdout=subprocess.PIPE, universal_newlines=True
    )
    return set(proc_result.stdout.splitlines())


def packages_in_requirements():
    with open('requirements.txt') as f:
        lines = f.readlines()
    packages = map(
        lambda line: line.strip(),
        lines
    )
    return set(packages)


def main():
    for package in (search_packages() - packages_in_requirements()):
        print(package)


if __name__ == '__main__':
    main()
