
VERSION = 1.0

OUTPUT_DIR=build
SOURCE_DIR=src
PDFLATEX=lualatex --shell-escape --interaction=nonstopmode \
 --output-directory=$(OUTPUT_DIR) --halt-on-error
BIBER=/opt/homebrew/bin/biber --input-directory=src \
 --output-directory=$(OUTPUT_DIR)
PDFLATEX_DEBUG_ARGS=--synctex=1 --file-line-error
CLEAN_AUXILARY_FILES=rm -rf $(OUTPUT_DIR)/*.aux $(OUTPUT_DIR)/*.log $(OUTPUT_DIR)/_minted-notes
SPELL_CHECK="hunspell -d en_US -l"

export VERSION

all: notes

notes: $(SOURCE_DIR)/notes.tex
	$(PDFLATEX) $(SOURCE_DIR)/notes.tex
	$(CLEAN_AUXILARY_FILES)

clean_auxilary_files:
	$(clean_auxilary_files)

spell_check:
	$(SPELL_CHECK) $(SOURCE_DIR)/notes.tex

clean:
	rm -rf build