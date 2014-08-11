set PATH=C:\dmd2\windows\\bin;C:\Program Files (x86)\Windows Kits\8.1\\\bin;%PATH%
dmd -g -debug -X -Xf"Debug\HashMap.json" -deps="Debug\HashMap.dep" -c -of"Debug\HashMap.obj" hashnode.d main.d myhashmap.d
if errorlevel 1 goto reportError

set LIB="C:\dmd2\windows\bin\..\lib"
echo. > Debug\HashMap.build.lnkarg
echo "Debug\HashMap.obj","Debug\HashMap.exe_cv","Debug\HashMap.map",user32.lib+ >> Debug\HashMap.build.lnkarg
echo kernel32.lib/NOMAP/CO/NOI >> Debug\HashMap.build.lnkarg

"C:\Program Files (x86)\VisualD\pipedmd.exe" -deps Debug\HashMap.lnkdep C:\dmd2\windows\bin\link.exe @Debug\HashMap.build.lnkarg
if errorlevel 1 goto reportError
if not exist "Debug\HashMap.exe_cv" (echo "Debug\HashMap.exe_cv" not created! && goto reportError)
echo Converting debug information...
"C:\Program Files (x86)\VisualD\cv2pdb\cv2pdb.exe" "Debug\HashMap.exe_cv" "Debug\HashMap.exe"
if errorlevel 1 goto reportError
if not exist "Debug\HashMap.exe" (echo "Debug\HashMap.exe" not created! && goto reportError)

goto noError

:reportError
echo Building Debug\HashMap.exe failed!

:noError
