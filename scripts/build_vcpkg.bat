@echo off
setlocal enabledelayedexpansion

rem Find vcpkg root first so that we can bail early if it's not found.
@REM if not defined VCPKG_ROOT (
@REM     echo VCPKG_ROOT not set, attempting to locate vcpkg.exe...
@REM     for /f "tokens=*" %%i in ('where vcpkg.exe 2^>nul') do (
@REM         set VCPKG_EXE_PATH=%%i
@REM         goto found
@REM     )
@REM     echo vcpkg.exe not found in PATH.
@REM     goto end
@REM     :found
@REM     for %%i in ("%VCPKG_EXE_PATH%") do (
@REM         set VCPKG_ROOT=%%~dpi
@REM     )
@REM     set VCPKG_ROOT=%VCPKG_ROOT:~0,-1%
@REM     echo Set VCPKG_ROOT to %VCPKG_ROOT%
@REM )

rem vcpkg install --triplet x64-windows # already ran once, it works
mkdir build
cmake -B build -S . -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-windows -DUSE_BUILTIN_OPENCSG=TRUE -DENABLE_CAIRO=FALSE -DHEADLESS=ON -DCMAKE_EXE_LINKER_FLAGS="/manifest:no" -DCMAKE_MODULE_LINKER_FLAGS="/manifest:no" -DCMAKE_SHARED_LINKER_FLAGS="/manifest:no"
cmake --build build
@REM cmake -B build -S . ^
@REM     -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake ^
@REM     -DVCPKG_TARGET_TRIPLET=x64-windows ^
@REM     -DUSE_BUILTIN_OPENCSG=TRUE ^
@REM     -DENABLE_CAIRO=FALSE ^
@REM     -DHEADLESS=ON ^
@REM     -DCMAKE_EXE_LINKER_FLAGS="/manifest:no" ^
@REM     -DCMAKE_MODULE_LINKER_FLAGS="/manifest:no" ^
@REM     -DCMAKE_SHARED_LINKER_FLAGS="/manifest:no" ^
@REM     -G "Visual Studio 17 2022" ^
@REM     -A x64
rem not related to vcpkg manifest ^^
@REM cmake --build build --config Release