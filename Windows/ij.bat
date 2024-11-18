@echo off
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


if "%~2"=="" (
    set command=%1

) else if "%~2"=="v" (
    set command=%1@@%2

) else if "%~3"=="" (
    echo Error! Type "ij" to show usage.
    exit /b

) else if "%~3"=="v" (
    echo Error! Type "ij" to show usage.
    exit /b

) else if "%~4"=="v" (
        set command=%1@@%2@%3@%4

) else if "%~4"=="" (
    set command=%1@@%2@%3

) else (
    echo Error! Type "ij" to show usage.
    exit /b
)


REM Start ImageJ with the given argument
start ImageJ.exe -macro %~p0open-imagej.ijm %command%
