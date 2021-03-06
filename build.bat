@echo off
::-----------------------------------------------------------------------------
:: Get the OS Variant
::-----------------------------------------------------------------------------
IF "%PROCESSOR_ARCHITECTURE%;%PROCESSOR_ARCHITEW6432%"=="x86;" (
  ::set OsVariant=win32
  set Vm-args=-Xms40m -Xmx384m -XX:MaxPermSize=384m
) ELSE (
  ::set OsVariant=win64
  set Vm-args=-Xms40m -Xmx512m -XX:MaxPermSize=512m -XX:-UseCompressedOops
)

::-----------------------------------------------------------------------------
:: Paths
::-----------------------------------------------------------------------------
set SCRIPT_DIR=%~dp0%
set ProjectHome=%SCRIPT_DIR%
set WorkspaceDir=%ProjectHome%\workspace
set ThisProjTools=%ProjectHome%\tools

%ThisProjTools%\eclipseArduino\eclipsec.exe -data %WorkspaceDir% -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -cleanBuild arduino_blink -vmargs -Dorg.eclipse.cdt.core.console=org.eclipse.cdt.core.systemConsole %Vm-args%

EXIT /B %ERRORLEVEL%
