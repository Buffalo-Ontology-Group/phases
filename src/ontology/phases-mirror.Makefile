# ------------------------------------------
# Makefile for managing mirrored ontologies
# ------------------------------------------

IMP=true # Global parameter to bypass import generation
MIR=true # Global parameter to bypass mirror generation
IMP_LARGE=true # Global parameter to bypass handling of large imports

ifeq ($(strip $(MIR)),true)

## Behaviour Change Intervention Ontology (BCIO)
BCIO_ONT = https://humanbehaviourchange.org/ontology/bcio.owl
.PHONY: mirror-bcio
.PRECIOUS: $(MIRRORDIR)/bcio.owl
mirror-bcio: | $(TMPDIR)
	curl -L $(BCIO_ONT) --create-dirs -o $(TMPDIR)/bcio-download.owl --retry 4 --max-time 200 && \
	$(ROBOT) convert -i $(TMPDIR)/bcio-download.owl -o $(TMPDIR)/$@.owl

## OBO Metadata Ontology (OMO)
.PHONY: mirror-omo
.PRECIOUS: $(MIRRORDIR)/omo.owl
mirror-omo: | $(TMPDIR)
	curl -L $(OBOBASE)/omo.owl --create-dirs -o $(TMPDIR)/omo-download.owl --retry 4 --max-time 200 && \
	$(ROBOT) convert -i $(TMPDIR)/omo-download.owl -o $(TMPDIR)/$@.owl

.PHONY: mirror-ro
.PRECIOUS: $(MIRRORDIR)/ro.owl
mirror-ro: | $(TMPDIR)
	curl -L $(OBOBASE)/ro.owl --create-dirs -o $(TMPDIR)/ro-download.owl --retry 4 --max-time 200 && \
	$(ROBOT) convert -i $(TMPDIR)/ro-download.owl -o $(TMPDIR)/$@.owl

## Mental Functioning Ontology (MF)
.PHONY: mirror-mf
.PRECIOUS: $(MIRRORDIR)/mf.owl
mirror-mf: | $(TMPDIR)
	curl -L $(OBOBASE)/mf.owl --create-dirs -o $(TMPDIR)/mf-download.owl --retry 4 --max-time 200 && \
	$(ROBOT) convert -i $(TMPDIR)/mf-download.owl -o $(TMPDIR)/$@.owl


## Relation Ontology (RO)
$(MIRRORDIR)/%.owl: mirror-% | $(MIRRORDIR)
	if [ -f $(TMPDIR)/mirror-$*.owl ]; then if cmp -s $(TMPDIR)/mirror-$*.owl $@ ; then echo "Mirror identical, ignoring."; else echo "Mirrors different, updating." &&\
		cp $(TMPDIR)/mirror-$*.owl $@; fi; fi

else # MIR=false
$(MIRRORDIR)/%.owl:
	@echo "Not refreshing $@ because the mirrorring pipeline is disabled (MIR=$(MIR))."
endif
