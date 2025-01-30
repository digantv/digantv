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

backdate-commits:
	@for month in $$(seq -f "%02g" 1 12); do \
	    for day in $$(seq -f "%02g" 1 31); do \
	        date="2024-$$month-$$day"; \
	        if date -d $$date >/dev/null 2>&1; then \
	            echo "Backdating commit for $$date"; \
	            echo "Commit on $$date" > commit.txt; \
	            git add commit.txt; \
	            GIT_COMMITTER_DATE="$$date 12:00:00" GIT_AUTHOR_DATE="$$date 12:00:00" git commit -m "Backdated commit for $$date"; \
	        fi \
	    done \
	done
	rm -f commit.txt

push:
	git push origin main
