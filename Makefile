
.PHONY: all commit

all: commit

commit:
    for i in {1..15}; do \
        echo "New line $$i" >> README.md; \
        git add README.md; \
        git commit -m "Add new line $$i to README.md"; \
    done
