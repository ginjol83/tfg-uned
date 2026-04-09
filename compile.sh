#!/bin/bash
# Script para compilar el documento LaTeX con archivos auxiliares organizados

MAIN="main"
BUILD_DIR="build"

# Función para mostrar ayuda
show_help() {
    echo "Uso: ./compile.sh [opción]"
    echo "Opciones:"
    echo "  Sin opción: compilación completa con latexmk"
    echo "  clean:      limpiar archivos auxiliares"
    echo "  cleanall:   limpiar todo incluyendo PDF"
    echo "  watch:      compilación continua automática"
    echo "  quick:      compilación rápida con pdflatex"
    echo "  help:       mostrar esta ayuda"
}

# Crear directorio build si no existe
mkdir -p "$BUILD_DIR"

case "$1" in
    "clean")
        echo "Limpiando archivos auxiliares..."
        latexmk -c
        rm -rf "$BUILD_DIR"/*
        echo "Limpieza completada"
        ;;
    "cleanall")
        echo "Limpieza completa (incluyendo PDF)..."
        latexmk -C
        rm -rf "$BUILD_DIR"/*
        rm -f "${MAIN}.pdf"
        echo "Limpieza completa terminada"
        ;;
    "watch")
        echo "Iniciando modo de compilación continua..."
        echo "Presiona Ctrl+C para detener"
        latexmk -pvc -pdf "${MAIN}.tex"
        ;;
    "quick")
        echo "Compilación rápida con pdflatex..."
        pdflatex -output-directory="$BUILD_DIR" "${MAIN}.tex"
        pdflatex -output-directory="$BUILD_DIR" "${MAIN}.tex"
        cp "$BUILD_DIR/${MAIN}.pdf" "./${MAIN}.pdf"
        echo "Compilación rápida completada"
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    "")
        echo "Compilando ${MAIN}.tex con latexmk..."
        if latexmk -pdf "${MAIN}.tex"; then
            echo "¡Compilación exitosa! PDF generado en $BUILD_DIR/${MAIN}.pdf"
            # Copiar el PDF al directorio principal para fácil acceso
            cp "$BUILD_DIR/${MAIN}.pdf" "./${MAIN}.pdf"
            echo "PDF copiado a ${MAIN}.pdf"
        else
            echo "Error en la compilación"
            exit 1
        fi
        ;;
    *)
        echo "Opción no reconocida: $1"
        show_help
        exit 1
        ;;
esac