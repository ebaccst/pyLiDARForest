SET python_exe=C:\Anaconda\envs\geo\python.exe
SET script="E:\heitor.guerra\PycharmProjects\pyLiDARForest\stuff\extract_raster.py"

%python_exe% %script% -s "SELECT evi_max, evi_min, geom FROM amazon_test" -r "E:\heitor.guerra\tests\extrapolar\EVI_max.tif" -o "E:\heitor.guerra" -a "evi_max" "evi_min"