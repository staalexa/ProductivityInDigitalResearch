TEX_ENGINE := pdflatex
TEX_FLAGS  := -shell-escape -interaction=batchmode

TEX_FILES        := $(wildcard *.tex)

TARGETS_SHEET    := $(patsubst %.tex,out/%-sheet.pdf,$(TEX_FILES))
TARGETS_SOLUTION := $(patsubst %.tex,out/%-solution.pdf,$(TEX_FILES))
TARGETS          := $(TARGETS_SHEET) $(TARGETS_SOLUTION)

WATCH_SHEET    := $(patsubst %.tex,watch-%-sheet,$(TEX_FILES))
WATCH_SOLUTION := $(patsubst %.tex,watch-%-solution,$(TEX_FILES))
WATCH_TARGETS  := $(WATCH_SHEET) $(WATCH_SOLUTION)

all: $(TARGETS)

sheet: $(TARGETS_SHEET)

solution: $(TARGETS_SOLUTION)

$(TARGETS_SHEET)    $(WATCH_SHEET):    FLAGTYPE=sheet
$(TARGETS_SOLUTION) $(WATCH_SOLUTION): FLAGTYPE=solution

$(TARGETS_SHEET):    out/%-sheet.pdf:    %.tex | out
$(TARGETS_SOLUTION): out/%-solution.pdf: %.tex | out

$(TARGETS):
	latexmk -$(TEX_ENGINE) $(TEX_FLAGS) $(WATCH_FLAG) -jobname="$*-$(FLAGTYPE)" -outdir="out" -auxdir="out/aux" "$<"

$(WATCH_TARGETS): WATCH_FLAG="-pvc"
$(WATCH_TARGETS): watch-%: out/%.pdf

out out/aux:
	mkdir -p $@

clean:
	rm -rf out

.PHONY: all clean sheet solution $(WATCH_TARGETS)
.PRECIOUS: $(TARGETS)
