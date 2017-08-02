from re import search
from os.path import join


class Transect(object):
    def __init__(self, path, filename):
        self._path = path
        self._file = filename
        self._number = self.__get_number_if_exist()

    @property
    def path(self):
        return join(self._path, self.file)

    @property
    def file(self):
        return self._file

    @property
    def number(self):
        return self._number

    def __get_number_if_exist(self):
        matcher = search("T*([0-9]+)", self._file)
        if matcher:
            return matcher.group(1).rjust(4, "0")
        return self.file
