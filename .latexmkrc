# Configuración de latexmk para mantener archivos auxiliares organizados

# Directorio para archivos auxiliares y de salida
$aux_dir = "build";
$out_dir = "build";

# Asegurarse de que el directorio existe
ensure_path('TEXINPUTS', './capitulos//');
ensure_path('TEXINPUTS', './capitulos/C1-introduccion//');
ensure_path('TEXINPUTS', './capitulos/C2-analisis//');
ensure_path('TEXINPUTS', './capitulos/C3-disenno//');
ensure_path('TEXINPUTS', './capitulos/C4-desarrollo//');
ensure_path('TEXINPUTS', './capitulos/C5-pruebas//');
ensure_path('TEXINPUTS', './capitulos/C6-conclusiones//');
ensure_path('TEXINPUTS', './capitulos/A1-anexo//');
ensure_path('TEXINPUTS', './capitulos/A2-anexo//');
ensure_path('TEXINPUTS', './imagenes//');
ensure_path('TEXINPUTS', './UMLs//');

# Motor de compilación (puedes cambiarlo según necesites)  
$pdf_mode = 1; # 1 = pdflatex, 4 = lualatex, 5 = xelatex

# Compilar automáticamente cuando cambien los archivos
$preview_continuous_mode = 1;

# Mostrar comandos ejecutados
$show_time = 1;

# Configuración para bibliografía
$bibtex_use = 1;

# Para archivos en subcarpetas (capitulos/), también usar build/
$ENV{'TEXMFOUTPUT'} = 'build';

# Limpiar archivos auxiliares al compilar
$clean_ext = "bbl nav snm vrb figlist makefile fls fdb_latexmk run.xml synctex.gz";