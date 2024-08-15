TEX_ENGINE := pdflatex
TEX_FLAGS  := -shell-escape -interaction=batchmode

TEX_FILES       := $(wildcard *.tex)

TARGETS_SLIDES  := $(patsubst %.tex,out/%-slides.pdf,$(TEX_FILES))
TARGETS_HANDOUT := $(patsubst %.tex,out/%-handout.pdf,$(TEX_FILES))
TARGETS         := $(TARGETS_SLIDES) $(TARGETS_HANDOUT)

WATCH_SLIDES  := $(patsubst %.tex,watch-%-slides,$(TEX_FILES))
WATCH_HANDOUT := $(patsubst %.tex,watch-%-handout,$(TEX_FILES))
WATCH_TARGETS := $(WATCH_SLIDES) $(WATCH_HANDOUT)

all: $(TARGETS)

slides: $(TARGETS_SLIDES)

handout: $(TARGETS_HANDOUT)

$(TARGETS_SLIDES)  $(WATCH_SLIDES):  FLAGTYPE=slides
$(TARGETS_HANDOUT) $(WATCH_HANDOUT): FLAGTYPE=handout

$(TARGETS_SLIDES):  out/%-slides.pdf:  %.tex | out
$(TARGETS_HANDOUT): out/%-handout.pdf: %.tex | out

$(TARGETS):
	latexmk -$(TEX_ENGINE) $(TEX_FLAGS) $(WATCH_FLAG) -jobname="$*-$(FLAGTYPE)" -outdir="out" -auxdir="out/aux" "$<"

$(WATCH_TARGETS): WATCH_FLAG="-pvc"
$(WATCH_TARGETS): watch-%: out/%.pdf

out out/aux:
	mkdir -p $@

clean:
	rm -rf out

.PHONY: all clean slides handout $(WATCH_TARGETS)
.PRECIOUS: $(TARGETS)
