.PHONY: all
all: help

.PHONY: clean
clean:
	rm -rf $(HOME)/.cache/nvim
	rm -rf $(HOME)/.local/share/nvim
	rm -rf $(HOME)/.local/state/nvim

.PHONY: help
help:
	@echo "Run \`make clean\` if you wish to remove nvim cache."
