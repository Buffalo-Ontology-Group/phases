# ----------------------------------------
# PHASES subset extraction Makefile
# ----------------------------------------
# Generates subset ontologies for:
#   - gero : classes annotated with in_subset "GERO"
#   - solo : classes annotated with in_subset "SOLO" and the ontology is $(ONT).owl


# ----------------------------------------
# Subset assets
# ----------------------------------------

SUBSETDIR = subsets
SUBSETS = gero solo

SUBSET_ROOTS = $(patsubst %, $(SUBSETDIR)/%, $(SUBSETS))
SUBSET_FILES = $(foreach n,$(SUBSET_ROOTS), $(foreach f,$(FORMATS_INCL_TSV), $(n).$(f)))

.PHONY: all_subsets
all_subsets: $(SUBSET_FILES)


# ----------------------------------------
# Subsets
# ----------------------------------------

$(SUBSETDIR)/gero.owl: $(ONT).owl $(SPARQLDIR)/subset-terms-gero.rq $(SUBSETDIR)/gero-annotations.owl | $(SUBSETDIR)
	@echo "\n** building $@ **"
	$(ROBOT) query -i $< -q $(word 2, $^) $@.tmp.csv &&\
	tail -n +2 $@.tmp.csv > $@.tmp.txt &&\
	rm $@.tmp.csv &&\
	$(ROBOT) extract --method BOT \
			--input $< \
			--term-file $@.tmp.txt \
		--output $@.tmp.owl &&\
	$(ROBOT) merge \
			--include-annotations true \
			--input $(word 3, $^) \
			--input  $@.tmp.owl \
		annotate \
			--ontology-iri $(URIBASE)/$(ONT)/$(notdir $@) \
			--version-iri $(URIBASE)/$(ONT)/releases/$(VERSION)/$(notdir $@) \
			--annotation owl:versionInfo $(VERSION) \
		--output $@ &&\
	rm $@.tmp.owl
.PRECIOUS: $(SUBSETDIR)/gero.owl


$(SUBSETDIR)/solo.owl: $(ONT).owl $(SPARQLDIR)/subset-terms-solo.rq $(SUBSETDIR)/solo-annotations.owl | $(SUBSETDIR)
	@echo "\n** building $@ **"
	$(ROBOT) query -i $< -q $(word 2, $^) $@.tmp.csv &&\
	tail -n +2 $@.tmp.csv > $@.tmp.txt &&\
	rm $@.tmp.csv &&\
	$(ROBOT) extract --method BOT \
			--input $< \
			--term-file $@.tmp.txt \
		--output $@.tmp.owl &&\
	$(ROBOT) merge \
			--include-annotations true \
			--input $(word 3, $^) \
			--input  $@.tmp.owl \
		annotate \
			--ontology-iri $(URIBASE)/$(ONT)/$(notdir $@) \
			--version-iri $(URIBASE)/$(ONT)/releases/$(VERSION)/$(notdir $@) \
			--annotation owl:versionInfo $(VERSION) \
		--output $@ &&\
	rm $@.tmp.owl
.PRECIOUS: $(SUBSETDIR)/solo.owl


$(SUBSETDIR)/%.tsv: $(SUBSETDIR)/%.owl
	$(ROBOT) query -f tsv -i $< -s ../sparql/labels.sparql $@
.PRECIOUS: $(SUBSETDIR)/%.tsv


$(SUBSETDIR)/%.obo: $(SUBSETDIR)/%.owl
	$(ROBOT) convert --input $< --check false -f obo $(OBO_FORMAT_OPTIONS) -o $@.tmp.obo && \
	grep -v ^owl-axioms $@.tmp.obo > $@ && rm $@.tmp.obo


$(SUBSETDIR)/%.json: $(SUBSETDIR)/%.owl
	$(ROBOT) convert --input $< --check false -f json -o $@.tmp.json &&\
	mv $@.tmp.json $@
