from re import search
from os.path import join


class Transect(object):
    def __init__(self, path, file):
        self._path = path
        self._file = file

    @property
    def path(self):
        return join(self._path, self.file)

    @property
    def file(self):
        return self._file

    @property
    def number(self):
        matcher = search("T*([0-9]+)", self._file)
        if matcher:
            return matcher.group(1).rjust(4, "0")
        return self.file
