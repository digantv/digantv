.PHONY: all commit backdate-commits push

all: commit

commit:
	git pull --rebase
	@for i in {1..15}; do \
	    echo "" >> README.md; \
	    git add README.md; \
	    git commit -m "Add new line $$i and a blank line to README.md" --no-edit; \
	    sed -i '$$d' README.md; \
	    git add README.md; \
	    git commit -m "Remove blank line after adding new line $$i to README.md" --no-edit; \
	done
	git push origin main


