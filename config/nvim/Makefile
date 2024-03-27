PREFIX:=$(HOME)/.local
SRCDIR:=$(PREFIX)/src/neovim

all: neovim

neovim: $(PREFIX)/bin/nvim

$(SRCDIR):
	git clone --depth 1 https://github.com/neovim/neovim.git $(SRCDIR)

$(SRCDIR)/build/bin/nvim: $(SRCDIR)
	make --directory=$(SRCDIR) \
		CMAKE_BUILD_TYPE=Release \
		CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$(PREFIX)"

$(PREFIX)/bin/nvim: $(SRCDIR)/build/bin/nvim
	make --directory=$(SRCDIR) install

.PHONY: all neovim
