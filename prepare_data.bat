@echo off
REM filepath: c:\git\FGT\prepare_data.bat

powershell -command "Expand-Archive -Path FGT_data.zip -DestinationPath ."
powershell -command "Expand-Archive -Path weights.zip -DestinationPath ."

if not exist FGT\checkpoint mkdir FGT\checkpoint
if not exist FGT\flowCheckPoint mkdir FGT\flowCheckPoint
if not exist LAFC\checkpoint mkdir LAFC\checkpoint

xcopy /E /I /Y weights\fgt\* FGT\checkpoint
xcopy /E /I /Y weights\lafc\* LAFC\checkpoint
xcopy /E /I /Y weights\lafc_single\* FGT\flowCheckPoint

rmdir /S /Q weights
del FGT_data.zip
del weights.zip