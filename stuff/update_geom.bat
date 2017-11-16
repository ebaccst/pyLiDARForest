SET python_exe=C:\Anaconda\envs\geo\python.exe
SET script=E:\heitor.guerra\PycharmProjects\pyLiDARForest\stuff\update_geom.py

::%python_exe%  %script% -l "E:\heitor.guerra\update_geom.log"
%python_exe%  %script% -s "update_geom_metrics.sql" -l "E:\heitor.guerra\update_geom_metrics.log"
%python_exe%  %script% -n "chm" -s "update_geom_chm.sql" -l "E:\heitor.guerra\update_geom_chm.log"

