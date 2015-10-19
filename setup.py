from setuptools import setup

setup(
    name='ksr',
    version='0.1.1',
    py_modules=['ksr'],
    url='https://github.com/jedahan/kickstarter',
    description='commandline kickstarter',
    author='Jonathan Dahan',
    author_email='jonathan@jonathan.is',
    license='ISC',
    install_requires=[
        'Click',
        'TinyDB',
    ],
    classifiers=[
      'Classifier: Development Status :: 4 - Beta',
      'Classifier: Environment :: Console',
      'Classifier: License :: OSI Approved :: ISC License (ISCL)',
      'Classifier: Natural Language :: English',
      'Classifier: Operating System :: MacOS :: MacOS X',
      'Classifier: Operating System :: POSIX :: Linux',
      'Classifier: Programming Language :: Python :: 3',
      'Classifier: Programming Language :: Python :: 3.5',
      'Classifier: Topic :: Software Development :: User Interfaces',
      'Classifier: Topic :: Utilities',
    ],
    entry_points='''
        [console_scripts]
        ksr=ksr:cli
    ''',
)
