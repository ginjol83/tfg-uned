# Makefile para compilación de LaTeX con archivos auxiliares organizados

# Configuración
MAIN = main
BUILD_DIR = build
TEX_FILES = $(shell find . -name "*.tex")

# Objetivo por defecto
all: pdf

# Compilar PDF usando latexmk
pdf: $(BUILD_DIR)/$(MAIN).pdf

$(BUILD_DIR)/$(MAIN).pdf: $(TEX_FILES)
	latexmk -pdf $(MAIN).tex

# Compilar con vista previa continua
watch:
	latexmk -pvc -pdf $(MAIN).tex

# Limpiar archivos auxiliares
clean:
	latexmk -c
	rm -rf $(BUILD_DIR)/*

# Limpiar completamente (incluyendo PDF)
cleanall:
	latexmk -C
	rm -rf $(BUILD_DIR)

# Crear directorio de compilación si no existe
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compilar solo una vez (sin latexmk)
quick:
	mkdir -p $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) $(MAIN).tex
	cp $(BUILD_DIR)/$(MAIN).pdf ./

.PHONY: all pdf watch clean cleanall quick