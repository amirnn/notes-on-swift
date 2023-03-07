
VERSION = 1.0

OUTPUT_DIR=build
SOURCE_DIR=src
PDFLATEX=lualatex --shell-escape --interaction=nonstopmode \
 --output-directory=$(OUTPUT_DIR) --halt-on-error
BIBER=/opt/homebrew/bin/biber --input-directory=src \
 --output-directory=$(OUTPUT_DIR)
PDFLATEX_DEBUG_ARGS=--synctex=1 --file-line-error
clean_auxilary_files=rm $(OUTPUT_DIR)/*.aux $(OUTPUT_DIR)/*.log

export VERSION

all: notes

notes: $(SOURCE_DIR)/notes.tex
	$(PDFLATEX) $(SOURCE_DIR)/notes.tex
	$(clean_auxilary_files)

clean_auxilary_files:
	clean_auxilary_files

clean:
	rm -rf build