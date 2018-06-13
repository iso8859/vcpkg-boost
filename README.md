# vcpkg-boost
Example of using vcpkg with boost

Starting using vcpkg to build boost from scratch on my machine was not easy.
vcpkg is a greate tool to compile boost

> git clone https://github.com/Microsoft/vcpkg
> cd vcpkg
> .\bootstrap-vcpkg.bat

I wanted to link boost in static and build x86 and x64 versions in debug and release

vcpkg install boost:x86-windows-static
vcpkg install boost:x64-windows-static

And now the problems begins

Why vcpkg build boost with Visual Studio 2015, VS2017 is installed? Generated boost lib contains -vc140- in file name

Why "vcpkg.exe integrate install" does nothing?

Why I can't build in debug mode

Why linker can't find libraries? Can't find boost_system lib or problem with /MT vs /MD flag?

I share here a CMakeFile.txt that works.

Simply check build.bat and adapt vcpkg path.
