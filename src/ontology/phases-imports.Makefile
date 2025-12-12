# ----------------------------------------
# Makefile for managing imports
# ----------------------------------------

# ----------------------------------------
# Import assets
# ----------------------------------------

IMPORTS =  omo bcio

IMPORT_ROOTS = $(patsubst %, $(IMPORTDIR)/%_import, $(IMPORTS))
IMPORT_OWL_FILES = $(foreach n,$(IMPORT_ROOTS), $(n).owl)
IMPORT_FILES = $(IMPORT_OWL_FILES)

.PHONY: all_imports
all_imports: $(IMPORT_FILES)

# ----------------------------------------
# Import modules
# ----------------------------------------
# Most ontologies are modularly constructed using portions of other ontologies
# These live in the imports/ folder
# This pattern uses ROBOT to generate an import module

.PRECIOUS: $(IMPORTDIR)/%_import.owl

.PHONY: refresh-imports
refresh-imports:
	$(MAKE) IMP=true MIR=true PAT=false IMP_LARGE=true all_imports -B

.PHONY: no-mirror-refresh-imports
no-mirror-refresh-imports:
	$(MAKE) IMP=true MIR=false PAT=false IMP_LARGE=true all_imports -B

.PHONY: refresh-imports-excluding-large
refresh-imports-excluding-large:
	$(MAKE) IMP=true MIR=true PAT=false IMP_LARGE=false all_imports -B

.PHONY: refresh-%
refresh-%:
	$(MAKE) IMP=true IMP_LARGE=true MIR=true PAT=false $(IMPORTDIR)/$*_import.owl -B

.PHONY: no-mirror-refresh-%
no-mirror-refresh-%:
	$(MAKE) IMP=true IMP_LARGE=true MIR=false PAT=false $(IMPORTDIR)/$*_import.owl -B

# ----------------------------------------
# OWL Imports
# ----------------------------------------

## OBO Metadata Ontology (OMO)
$(IMPORTDIR)/omo_import.owl: $(MIRRORDIR)/omo.owl
	if [ $(IMP) = true ]; then $(ROBOT) \
        remove \
            --input $< \
            --select "owl:deprecated='true'^^xsd:boolean" \
        remove \
            --select classes \
        annotate \
            --annotate-defined-by true \
        annotate \
			--remove-annotations \
            --ontology-iri $(URIBASE)/$(ONT)/$@ \
            --version-iri $(URIBASE)/$(ONT)/$@ \
		convert --format ofn \
        --output $@.tmp.owl && mv $@.tmp.owl $@; fi

## Behaviour Change Intervention Ontology (BCIO)
.PRECIOUS: $(IMPORTDIR)/bcio_import.owl

$(IMPORTDIR)/bcio_import.owl: $(MIRRORDIR)/bcio.owl $(IMPORTDIR)/bcio_terms.txt
	@echo "*** building $@ ***"
	$(ROBOT) \
		extract \
			--input $< \
			--method bot \
			--term-file $(word 2, $^) \
		remove \
			--term http://purl.obolibrary.org/obo/BFO_0000008 \
			--term http://purl.obolibrary.org/obo/BFO_0000038 \
			--term http://humanbehaviourchange.org/ontology/BCIO_039000 \
			--term http://humanbehaviourchange.org/ontology/BCIO_050806 \
			--term http://humanbehaviourchange.org/ontology/BCIO_002000 \
		annotate \
			--annotate-defined-by true \
		annotate \
			--ontology-iri $(URIBASE)/$(ONT)/$@ \
			--version-iri $(URIBASE)/$(ONT)/$@ \
		convert --format ofn \
		--output $@.tmp.owl && mv $@.tmp.owl $@

## Relation Ontology (RO)
$(IMPORTDIR)/ro_import.owl: $(MIRRORDIR)/ro.owl
	if [ $(IMP) = true ]; then $(ROBOT) \
        remove \
            --input $< \
            --select "owl:deprecated='true'^^xsd:boolean" \
            --select classes \
        extract \
            --method MIREOT \
            --lower-terms $(IMPORTDIR)/ro_terms.txt \
        annotate \
            --annotate-defined-by true \
        annotate \
			--remove-annotations \
            --ontology-iri $(URIBASE)/$(ONT)/$@ \
			--version-iri $(URIBASE)/$(ONT)/$@ \
        --output $@.tmp.owl && mv $@.tmp.owl $@; fi

