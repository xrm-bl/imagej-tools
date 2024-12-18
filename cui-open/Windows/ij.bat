@echo off
REM Get the current directory path
set CURRENT_DIRECTORY=%cd%

REM Check if %1 is empty
if "%~1"=="" (
    echo Empty file/directory path!
    echo USAGE 
    echo ij [file_path] : open a single image
    echo ij [dir_path] : open an image directory as a sequence
    echo ij [dir_path] v : open an image directory as a virtual stack sequence
    echo ij [dir_path] [i] [j] : open ith - jth images in a directory as a sequence
    echo ij [dir_path] [i] [j] v : open ith - jth images in a directory as a virtual stack sequence
    exit /b
)

if not "%~5"=="" (
    echo Too many arguments! Type "ij" to show usage.
    exit /b
)

REM Resolve the absolute path of the argument
set INPUT_PATH=%~1
set ABSDIR=""

REM Check if the argument exists as a file
if exist "%INPUT_PATH%" (
    for %%f in ("%INPUT_PATH%") do (
        if exist "%%~ff" (
            set ABSDIR=%%~ff
        )
    )
)

REM Check if the argument exists as a directory
if exist "%INPUT_PATH%\" (
    for %%d in ("%INPUT_PATH%\") do (
        if exist "%%~fd" (
            set ABSDIR=%%~fd
        )
    )
)

REM Build the command string based on input arguments
if "%~2"=="" (
    set command=%ABSDIR%
) else if "%~2"=="v" (
    set command=%ABSDIR%@@%2
) else if "%~3"=="" (
    echo Error! Type "ij" to show usage.
    exit /b
) else if "%~3"=="v" (
    echo Error! Type "ij" to show usage.
    exit /b
) else if "%~4"=="v" (
    set command=%ABSDIR%@@%2@%3@%4
) else if "%~4"=="" (
    set command=%ABSDIR%@@%2@%3
) else (
    echo Error! Type "ij" to show usage.
    exit /b
)

cd /d %~dp0

REM Ensure ImageJ.exe exists
if not exist "ImageJ.exe" (
    echo Error: ImageJ.exe not found in %~dp0
    cd /d %CURRENT_DIRECTORY%
    exit /b
)

REM Start ImageJ with the given argument
start ImageJ.exe -macro open-imagej.ijm %command%

REM Return to the original directory
cd /d %CURRENT_DIRECTORY%

