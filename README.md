# TFG — IDE para desarrollo de aplicaciones para máquinas de 8 bits con C

**Autor:** Andrés Giménez Perales  
**Director:** Jose Manuel Diaz Martinez  
**Grado:** Ingeniería Informática — UNED  
**Modalidad:** Específica  
**Convocatoria:** Junio 2026  

---

## Descripción

Memoria del Trabajo de Fin de Grado sobre el diseño e implementación de **IDE para desarrollo de aplicaciones para máquinas de 8 bits con C**, un entorno de desarrollo integrado (IDE) hecho en Java orientado a la creación de software en C para sistemas de 8 bits (Game Boy, ZX Spectrum, Amstrad CPC, entre otros).

El IDE integra en una única herramienta:

- Editor de código con resaltado de sintaxis para C/C++.
- Gestión de proyectos con explorador de archivos.
- Compilación cruzada mediante toolchains externas (GBDK, Z88DK, Makefile).
- Ejecución en emulador directamente desde el IDE.
- Sistema de plugins extensible sin modificar el núcleo.
- Búsqueda avanzada en archivo y en proyecto completo.
- Soporte multiidioma (Español / English).
- Consola de salida y de depuración integradas.

---

## Estructura del repositorio

```
.
├── main.tex                  # Documento principal LaTeX
├── capitulos/                # Capítulos de la memoria
│   ├── C1-introduccion.tex
│   ├── C2-analisis.tex
│   ├── C3-disenno.tex
│   ├── C4-desarrollo.tex
│   ├── C5-planificacion.tex
│   ├── C6-pruebas.tex
│   ├── C7-conclusiones.tex
│   ├── A1-anexo.tex
│   ├── A2-anexo.tex
│   └── bibliografia.bib
└── imagenes/                 # Recursos gráficos organizados por categoría
    ├── aplicacion/
    ├── capturas_codigo/
    ├── diagramas/
    ├── disenno/              # Mockups de pantallas (Config y Main)
    ├── ejemplos/
    ├── herramientas_externas/
    ├── manual/
    ├── tests/
    └── Umls/

```

---

## Compilar la memoria (generar PDF)

### Requisitos

- [MiKTeX](https://miktex.org/) o cualquier distribución TeX Live.
- `latexmk` (incluido en MiKTeX).

### Compilación

```bash
latexmk -pdf -interaction=nonstopmode main.tex
```

El PDF resultante se genera como `main.pdf` en la raíz del proyecto.

Para limpiar los archivos auxiliares:

```bash
latexmk -CA
```

---

## Tecnologías del proyecto documentado

| Tecnología | Uso |
|---|---|
| Java 17 + JavaFX 17 | Lógica e interfaz gráfica del IDE |
| RichTextFX | Editor de código con resaltado de sintaxis |
| Ikonli / FontAwesome 5 | Iconografía de la interfaz |
| Maven | Gestión de dependencias y construcción |
| GBDK-2020 | Toolchain para Game Boy |
| Z88DK | Toolchain para ZX Spectrum y Amstrad CPC |
| SDCC | Compilador C cruzado base |

---

## Plataformas objetivo

El IDE está diseñado principalmente para:

- **Nintendo Game Boy** (CPU Z80-like, librería GBDK-2020)
- **ZX Spectrum** (CPU Z80, toolchain Z88DK)
- **Amstrad CPC** (CPU Z80, toolchain Z88DK)

Gracias al sistema de plugins, puede extenderse la funcnionalidad.

---
