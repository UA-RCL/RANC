from setuptools import setup

def readme():
    with open('README.md') as f:
        return f.read()

setup(name='rancutils',
      version='0.1',
      description='Utility functions for working with the RANC architecture.',
      classifiers=[
          'Programming Language :: Python :: 3.6.1'
      ],
      url='FIXME',
      author='Ruben Purdy',
      author_email='rubenpurdy@email.arizona.edu',
      license='MIT',
      packages=['rancutils'],
      install_requires=[
          'numpy',
          'bitstring',
          'imageio',
          'pandas'
      ],
      zip_safe=False)
