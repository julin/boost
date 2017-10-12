@echo off

setlocal

pushd "%~dp0/libs"

for /f %%d in ('dir *. /b') do (
	if not exist %%d\src (
		echo Blasting %%d
		if exist %%d (
			rmdir /s /q %%d
		)
	) else (
		echo Cleaning %%d
		if exist %%d\build (
			rmdir /s /q %%d\build
		)
		if exist %%d\test (
			rmdir /s /q %%d\test
		)
		if exist %%d\doc (
			rmdir /s /q %%d\doc
		)
		if exist %%d\example (
			rmdir /s /q %%d\example
		)
		if exist %%d\meta (
			rmdir /s /q %%d\meta
		)
	)
)

popd
pause
