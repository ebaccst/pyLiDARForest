SET python_exe=C:\Anaconda\envs\geo\python.exe
SET zonal_stats=E:\heitor.guerra\PycharmProjects\pyLiDARForest\stuff\ogr_merge.py

%python_exe% %zonal_stats% -v "E:\heitor.guerra\bouding_box_transects_fwf\sirgas_5880_with_number" -f "E:\heitor.guerra\voados\transects_merged_5880.shp" -l "E:\heitor.guerra\bouding_box_transects_fwf\merge.log"
