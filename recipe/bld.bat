
if not exist xdr-4.0-mingw2 tar -xzf xdr-4.0-mingw2.tar.gz

pushd xdr-4.0-mingw2

  :: Build using ming64 via msys2
  :: mingw32-make.exe
  bash -c "./configure --build=x86_64-w64-mingw32"
  if %errorlevel% neq 0 exit /b %errorlevel%

  bash -c "make.exe clean"
  if %errorlevel% neq 0 exit /b %errorlevel%

  bash -c "make.exe"
  if %errorlevel% neq 0 exit /b %errorlevel%

  if not exist %LIBRARY_LIB% mkdir %LIBRARY_LIB%
  if not exist %LIBRARY_INC% mkdir %LIBRARY_INC%

  copy libxdr.a %LIBRARY_LIB%
  xcopy /y /s /i rpc %LIBRARY_INC%\rpc

  mv DISCLAIMER.RPC ../

popd
