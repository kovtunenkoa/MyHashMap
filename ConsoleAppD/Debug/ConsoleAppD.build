set PATH=C:\dmd2\windows\\bin;C:\Program Files (x86)\Windows Kits\8.1\\\bin;%PATH%
dmd -g -debug -X -Xf"Debug\ConsoleAppD.json" -deps="Debug\ConsoleAppD.dep" -c -of"Debug\ConsoleAppD.obj" hashnode.d main.d myhashmap.d
if errorlevel 1 goto reportError

set LIB="C:\dmd2\windows\bin\..\lib"
echo. > Debug\ConsoleAppD.build.lnkarg
echo "Debug\ConsoleAppD.obj","Debug\ConsoleAppD.exe_cv","Debug\ConsoleAppD.map",user32.lib+ >> Debug\ConsoleAppD.build.lnkarg
echo kernel32.lib/NOMAP/CO/NOI >> Debug\ConsoleAppD.build.lnkarg

"C:\Program Files (x86)\VisualD\pipedmd.exe" -deps Debug\ConsoleAppD.lnkdep C:\dmd2\windows\bin\link.exe @Debug\ConsoleAppD.build.lnkarg
if errorlevel 1 goto reportError
if not exist "Debug\ConsoleAppD.exe_cv" (echo "Debug\ConsoleAppD.exe_cv" not created! && goto reportError)
echo Converting debug information...
"C:\Program Files (x86)\VisualD\cv2pdb\cv2pdb.exe" "Debug\ConsoleAppD.exe_cv" "Debug\ConsoleAppD.exe"
if errorlevel 1 goto reportError
if not exist "Debug\ConsoleAppD.exe" (echo "Debug\ConsoleAppD.exe" not created! && goto reportError)

goto noError

:reportError
echo Building Debug\ConsoleAppD.exe failed!

:noError
