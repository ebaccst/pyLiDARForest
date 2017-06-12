import os
import time
import logging
from transect import Transect


def has_extension(file, extension):
    return file.endswith(extension, -1 * len(extension))


def get_directories(path, _sof_):
    directories = []
    for dir in os.listdir(path):
        if os.path.isdir(os.path.join(path, dir)) and _sof_(dir):
            directories.append(Transect(path, dir).number)
    return sorted(directories)


def get_files(path, _sof_):
    files = {}
    for filename in os.listdir(path):
        if os.path.isfile(os.path.join(path, filename)) and _sof_(filename):
            transect = Transect(path, filename)
            if transect.number not in files:
                files[transect.number] = []

            files[transect.number].append(transect.path)
    return files


def is_a_transect_directory(dir):
    return dir.startswith("T-")


def is_a_transect_file(file):
    return has_extension(file, ".asc")


if __name__ == "__main__":
    # Server
    # logging.basicConfig(filename="check_processed_transects.log", level=logging.INFO)

    # Test
    logging.basicConfig(level=logging.INFO)

    # Path
    TRANSECT = r"G:\TRANSECTS"
    METRICS = r"G:\Mapa_Biomassa_EBA\Processos_T_LIDAR\METRICAS_all"

    # Measure process time
    t0 = time.clock()

    transects = get_directories(TRANSECT, is_a_transect_directory)
    metrics = get_files(METRICS, is_a_transect_file)
    for number in transects:
        if number not in metrics:
            logging.warning("Transect {} has no metric in '{}'".format(number, METRICS))

    logging.info("The transects were reprojected in {} seconds.".format(time.clock() - t0))
