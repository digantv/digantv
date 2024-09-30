.PHONY: all commit

all: commit

commit:
	@for i in {1..15}; do \
	    echo "  " >> README.md; \
	    git add README.md; \
	    git commit -m "Add new line $$i to README.md" --no-edit; \
        git push origin main;\
	done
