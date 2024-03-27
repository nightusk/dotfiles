PREFIX:=$(HOME)/.local
SRCDIR:=$(PREFIX)/src/vim

all: vim

vim: $(PREFIX)/bin/vim

$(SRCDIR):
	git clone --depth 1 https://github.com/vim/vim.git $(SRCDIR)

$(SRCDIR)/src/auto/config.h: $(SRCDIR)
	make --directory=$(SRCDIR) reconfig \
		CONF_OPT_FAIL=--enable-fail-if-missing \
		prefix=$(PREFIX)

$(SRCDIR)/src/vim: $(SRCDIR)/src/auto/config.h
	make --directory=$(SRCDIR)

$(PREFIX)/bin/vim: $(SRCDIR)/src/vim
	make --directory=$(SRCDIR) install prefix=$(PREFIX)

.PHONY: all vim
