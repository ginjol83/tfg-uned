@echo off
REM Script para compilar el documento LaTeX con archivos auxiliares organizados

setlocal
set MAIN=main
set BUILD_DIR=build

REM Crear directorio build si no existe
if not exist %BUILD_DIR% mkdir %BUILD_DIR%

if "%1"=="clean" goto :clean
if "%1"=="cleanall" goto :cleanall
if "%1"=="watch" goto :watch
if "%1"=="quick" goto :quick
if "%1"=="chapter" goto :chapter

REM Compilación normal con pdflatex (2 pasadas)
echo Compilando %MAIN%.tex con pdflatex...
pdflatex -output-directory=%BUILD_DIR% %MAIN%.tex
pdflatex -output-directory=%BUILD_DIR% %MAIN%.tex
if %ERRORLEVEL% EQU 0 (
    echo Compilación exitosa! PDF generado en %BUILD_DIR%\%MAIN%.pdf
    REM Copiar el PDF al directorio principal para fácil acceso
    copy "%BUILD_DIR%\%MAIN%.pdf" "%MAIN%.pdf" >nul
    echo PDF copiado a %MAIN%.pdf
) else (
    echo Error en la compilación
)
goto :end

:clean
echo Limpiando archivos auxiliares...
if exist %BUILD_DIR% rmdir /s /q %BUILD_DIR%
mkdir %BUILD_DIR%
REM Limpiar también posibles archivos auxiliares en capitulos/
del /q "capitulos\*.aux" "capitulos\*.log" "capitulos\*.fls" "capitulos\*.fdb_latexmk" "capitulos\*.out" "capitulos\*.synctex.gz" "capitulos\*.pdf" 2>nul
del /q "capitulos\*\*.aux" "capitulos\*\*.log" "capitulos\*\*.fls" "capitulos\*\*.fdb_latexmk" "capitulos\*\*.out" "capitulos\*\*.synctex.gz" "capitulos\*\*.pdf" 2>nul
echo Limpieza completada
goto :end

:cleanall
echo Limpieza completa (incluyendo PDF)...
if exist %BUILD_DIR% rmdir /s /q %BUILD_DIR%
if exist %MAIN%.pdf del %MAIN%.pdf
mkdir %BUILD_DIR%
del /q "capitulos\*.aux" "capitulos\*.log" "capitulos\*.fls" "capitulos\*.fdb_latexmk" "capitulos\*.out" "capitulos\*.synctex.gz" "capitulos\*.pdf" 2>nul
del /q "capitulos\*\*.aux" "capitulos\*\*.log" "capitulos\*\*.fls" "capitulos\*\*.fdb_latexmk" "capitulos\*\*.out" "capitulos\*\*.synctex.gz" "capitulos\*\*.pdf" 2>nul
echo Limpieza completa terminada
goto :end

:watch
echo Modo watch no disponible sin latexmk
echo Usa: compile.bat para compilar manualmente
goto :end

:quick
echo Compilación rápida con pdflatex...
pdflatex -output-directory=%BUILD_DIR% %MAIN%.tex
pdflatex -output-directory=%BUILD_DIR% %MAIN%.tex
copy "%BUILD_DIR%\%MAIN%.pdf" "%MAIN%.pdf" >nul
echo Compilación rápida completada
goto :end

:chapter
if "%2"=="" (
    echo Error: Especifica el nombre del capítulo
    echo Ejemplo: compile.bat chapter C1-introduccion
    goto :end
)
echo Compilando capítulo individual: %2.tex
pdflatex -output-directory=%BUILD_DIR% "capitulos\%2\%2.tex"
if %ERRORLEVEL% EQU 0 (
    echo Capítulo compilado! PDF: %BUILD_DIR%\%2.pdf
    copy "%BUILD_DIR%\%2.pdf" "capitulos\%2\%2.pdf" >nul 2>nul
) else (
    echo Error compilando capítulo %2
)
goto :end

:end
echo.
echo Uso: compile.bat [opción] [archivo]
echo   Sin opción:     compilación completa con latexmk
echo   clean:          limpiar archivos auxiliares
echo   cleanall:       limpiar todo incluyendo PDF
echo   watch:          compilación continua automática
echo   quick:          compilación rápida con pdflatex
echo   chapter [nombre]: compilar capítulo individual (ej: chapter C1-introduccion)