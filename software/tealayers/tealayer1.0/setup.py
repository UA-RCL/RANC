from setuptools import setup

def readme():
    with open('../README.md') as f:
        return f.read()

setup(name='tealayers',
      version='0.1',
      description='Keras layers to use for running TeaLearning networks.',
      classifiers=[
          'Programming Language :: Python :: 3.6.1'
      ],
      url='FIXME',
      author='Ruben Purdy',
      author_email='rubenpurdy@email.arizona.edu',
      license='MIT',
      packages=['tealayers'],
      install_requires=[
          #'tensorflow',
          'keras',
          'numpy'
      ],
      zip_safe=False)
