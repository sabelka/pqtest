rmdir /s /q build-mingw-release
mkdir build-mingw-release
cd build-mingw-release
conan install .. --build=missing -pr:h=mingw -pr:b=mingw
if %errorlevel% neq 0 exit /b %errorlevel%

call activate.bat

cmake .. -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_BUILD_TYPE=Release
if %errorlevel% neq 0 exit /b %errorlevel%

mingw32-make 
if %errorlevel% neq 0 exit /b %errorlevel%

call deactivate.bat

echo SUCCESS
cd ..

