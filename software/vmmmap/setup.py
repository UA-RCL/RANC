from setuptools import setup

def readme():
    with open('README.md') as f:
        return f.read()

setup(
        name='vmmmap',
        version = '0.1',
        description = 'Utility functions for mapping VMM Corelets to RANC cores',
        classifiers = [
            'Programming Language :: Python :: 3.6.1'
        ],
        url = 'FIXME',
        author = 'UA RCL',
        license = 'MIT',
        packages = ['vmmmap'],
        install_requires=[
            'numpy',
            'bitstring'
        ],
        zip_safe = False)

