SET python_exe=C:\Anaconda\envs\geo\python.exe
SET zonal_stats=E:\heitor.guerra\PycharmProjects\pyLiDARForest\app\gdal\ogr_merge.py

%python_exe% %zonal_stats% -v "G:\Mapa_Biomassa_EBA\Processos_T_LIDAR\SHAPES_transectos\las_boundary_EPSG_5880" -f "E:\heitor.guerra\Voados\transects_merged_5880.shp" -l "E:\heitor.guerra\Voados\merge.log"
