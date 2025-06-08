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
@REM vcpkg install --triplet x64-windows

mkdir build

cmake -B build -S . ^
    -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake ^
    -DVCPKG_TARGET_TRIPLET=x64-windows ^
    -DUSE_BUILTIN_OPENCSG=TRUE ^
    -DENABLE_CAIRO=FALSE ^
    -DHEADLESS=ON ^
    -DCMAKE_EXE_LINKER_FLAGS="/manifest:no" ^
    -DCMAKE_MODULE_LINKER_FLAGS="/manifest:no" ^
    -DCMAKE_SHARED_LINKER_FLAGS="/manifest:no"

@REM cmake --build build --config Debug
@REM cmake --build build --config Release currently not working, first trying a vs sln based approach.