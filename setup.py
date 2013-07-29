import os
from setuptools import setup, find_packages

setup(name='YourAppName', version='1.0',
      description='OpenShift Python-2.7 Community Cartridge based application',
      author='Your Name', author_email='ramr@example.org',
      url='http://www.python.org/sigs/distutils-sig/',

      #  Uncomment one or more lines below in the install_requires section
      #  for the specific client drivers/modules your application needs.
      # Instalation setup
      packages=find_packages(),
      include_package_data=True,
      install_requires=open(
            '%swsgi/openshift/requirements.txt' % os.environ.get(
                  'OPENSHIFT_REPO_DIR', PROJECT_ROOT)).readlines(),
)
