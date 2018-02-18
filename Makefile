/ := ./

$/%.html: $/%.md
	pandoc $< -t html > $@

$/%.gv: $/%.gv.sh
	@mkdir -vp $$(dirname $@)
	@{ echo 'cat <<EOM' ; cat $< ; echo 'EOM' ; } > $/$<2.sh ; \
	htd package update ; . ./.package.sh ; \
	. ./$<2.sh > $@ ;
	@rm ./$<2.sh
	
$/asset/%.png: $/%.gv
	@mkdir -vp $$(dirname $@)
	dot -Tpng -o$@ $<

$/asset/%.svg: $/%.gv
	@mkdir -vp $$(dirname $@)
	dot -Tsvg -o$@ $<


default: all

DOCS = README.html 
ASSETS = asset/README-fig1.svg

$(DOCS) $(ASSETS): Makefile

doc: $(DOCS) $(ASSETS)
all: $(DOCS) $(ASSETS)
