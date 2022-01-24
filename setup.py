import sys
import platform
from setuptools import setup, find_packages, Extension

if sys.platform == 'darwin':
    libcrypto = ['libcrypto.1.1.dylib']
elif sys.platform == 'win32':
    if platform.architecture()[0] == '32bit':
        libcrypto = ['libcrypto-1_1.dll']
    else:
        libcrypto = ['libcrypto-1_1-x64.dll']
else:
    libcrypto = []

with open('README.md', 'r', encoding='utf-8') as f:
    readme = f.read()

setup(
    name='haccrypto',
    version='0.1.2',
    packages=find_packages(),
    url='https://github.com/luigoalma/haccrypto',
    license='MIT',
    author='luigoalma',
    description='Nintendo Switch XTSN crypto for Python',
    long_description=readme,
    long_description_content_type='text/markdown',
    package_data={'haccrypto': ['openssl-license.txt'] + libcrypto},
    classifiers=[
        'Topic :: Utilities',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
    ],
    ext_modules=[Extension('haccrypto._crypto', sources=['haccrypto/_crypto.cpp', 'haccrypto/aes.cpp'],
                           extra_compile_args=['/Ox' if sys.platform == 'win32' else '-O3',
                                               '' if sys.platform == 'win32' else '-std=c++11'])]
)
