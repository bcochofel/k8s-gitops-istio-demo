.PHONY: release

SEMTAG=tools/semtag

scope ?= "minor"

release:
	$(SEMTAG) final -s $(scope)
