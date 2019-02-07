#!/usr/bin/env python

from setuptools import setup, find_packages


def version():
    with open('VERSION') as f:
        return f.read()


setup(
    name='voltha-protos',
    version=version(),
    description='Protobuf interface definitions',
    author='VOLTHA project',
    author_email='voltha-dev@opencord.org',
    url='https://gerrit.opencord.org/gitweb?p=voltha-protos.git',
    license='Apache Software License',
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
    ],
    keywords='protobuf voltha',
    packages = find_packages(where="python"),
    package_dir = {"": "python"},
    install_requires = [
        "googleapis-common-protos~=1.5.6"
    ],
    include_package_data=True,
)
