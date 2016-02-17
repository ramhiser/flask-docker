from setuptools import setup, find_packages


with open("requirements.txt") as req_file:
    requirements = filter(lambda r_striped: r_striped,
                          map(lambda r: r.strip(), req_file.readlines()))

setup(name='foo',
      version='0.1',
      description='weeeee',
      author='John Ramey',
      packages=find_packages(exclude=["tests", "dist"]),
      install_requires=requirements)
