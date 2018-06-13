set vcpkg=-DCMAKE_TOOLCHAIN_FILE=D:/dev/vcpkg/scripts/buildsystems/vcpkg.cmake
set msvc=-DMSVC=TRUE
set Version=-T v141
md x86
cd x86
set triplet=-DVCPKG_TARGET_TRIPLET=x86-windows-static
cmake.exe %vcpkg% %msvc% %triplet% -G "Visual Studio 15 2017" %Version% ..\src
cd ..
md x64
cd x64
set triplet=-DVCPKG_TARGET_TRIPLET=x64-windows-static
cmake.exe %vcpkg% %msvc% %triplet% -G "Visual Studio 15 2017 Win64" %Version% ..\src
cd ..