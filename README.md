# TFG - IDE para máquinas de 8 bits

Proyecto LaTeX con archivos auxiliares organizados en la carpeta `build/`.

## Estructura

- `main.tex` - Documento principal
- `capitulos/` - Capítulos organizados en subcarpetas
- `imagenes/` - Imágenes del proyecto  
- `UMLs/` - Diagramas UML
- `build/` - Archivos auxiliares y PDF generado

## Compilación

### Windows (Recomendado)
```cmd
.\compile.bat          # Compilar
.\compile.bat clean    # Limpiar archivos auxiliares
.\compile.bat watch    # Compilación automática
```

### Alternativas
```cmd
# pdflatex directo
pdflatex -output-directory=build main.tex

# Con latexmk
latexmk -pdf main.tex

# Unix/Linux
make
```

## Solución de Problemas

- **Error pdflatex**: Instalar MiKTeX o TeX Live y añadir al PATH
- **Error carpeta build**: Se crea automáticamente, o crear con `mkdir build`
- **Error capítulos**: Los archivos deben estar en `capitulos/`