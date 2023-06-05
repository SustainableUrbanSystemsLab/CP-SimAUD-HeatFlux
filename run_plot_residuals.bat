

@ECHO OFF

SETLOCAL EnableDelayedExpansion

REM Insert your conda env here
SET CONDA_ENV=base

CALL :activate_conda_env

REM Insert your python script here
REM CALL python script.py 


python plot.py


REM
REM The boilerplate code to activate conda
REM

:activate_conda_env

    REM Reset errorlevel to 0
    VERIFY > nul

    CALL conda info 1>nul 2>nul

    IF NOT ERRORLEVEL 1 (
        where conda > .conda_path
        SET /p CONDA_PATH= < .conda_path
		SET CONDA_PATH=!CONDA_PATH:Library\bin=Scripts!
		SET CONDA_PATH=!CONDA_PATH:conda.bat=!
		SET CONDA_PATH=!CONDA_PATH:conda.exe=!
		ECHO !CONDA_PATH!
        ECHO A conda installation located in !CONDA_PATH! is available in your PATH variable and is thus used.
        SET CONDASCRIPTS=!CONDA_PATH!
        GOTO CONDA_FOUND
    )
    ECHO Conda is not available in your PATH. Guessing the location of the installation...

    ECHO Checking in user-specific installations below %USERPROFILE% for which users usually have writing access.
    SET CONDASCRIPTS=%USERPROFILE%\Anaconda3\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )
    SET CONDASCRIPTS=%USERPROFILE%\Miniconda3\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )
    ECHO Checking at computer-wide shared folders for which the user might not have writing access and thus the creation
    ECHO might fail. It is usually preferred if a user-specific installation (i.e. in a folder below %USERPROFILE%)
    ECHO would have been used instead.
    SET CONDASCRIPTS=C:\ProgramData\Anaconda3\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )
    SET CONDASCRIPTS=C:\ProgramData\Miniconda3\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )
    SET CONDASCRIPTS=C:\Anaconda3\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )
    SET CONDASCRIPTS=C:\Miniconda3\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )
    SET CONDASCRIPTS=C:\Anaconda\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )
    SET CONDASCRIPTS=C:\Miniconda\Scripts\
    ECHO Checking for conda installation at !CONDASCRIPTS!
    IF EXIST %CONDASCRIPTS% (
        GOTO CONDA_FOUND
    )

    REM We have checked all default paths, nothing else to do than to fail.
    ECHO No conda installation was found. Please install either Anaconda or Miniconda first before invoking this script.
    PAUSE
    EXIT 2

    REM Once a conda installation is found, proceed here
    :CONDA_FOUND
    ECHO The scripts folder at !CONDASCRIPTS! has been detected as a valid conda installation.
    ECHO The conda commands from this directory are used in the following.

    CALL !CONDASCRIPTS!activate !CONDA_ENV! && (
        ECHO The environment '!CONDA_ENV!' has been activated successfully.
    ) || (
        ECHO The environment '!CONDA_ENV!' could not be activated. Please check the output for hints.
        PAUSE
        EXIT 2
    )

GOTO :EOF

PAUSE