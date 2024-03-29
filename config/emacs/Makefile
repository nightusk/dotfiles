PREFIX:=$(HOME)/.local
SRCDIR:=$(PREFIX)/src/emacs

all: emacs

emacs: $(PREFIX)/bin/emacs

$(SRCDIR):
	git clone --depth 1 https://github.com/emacs-mirror/emacs.git $(SRCDIR)

$(SRCDIR)/src/emacs :$(SRCDIR)
	make --directory=$(SRCDIR) configure=" \
		--with-gif=ifavailable \
		--with-pgtk \
		--with-xpm=ifavailable \
		--prefix=$(PREFIX) "

$(PREFIX)/bin/emacs: $(SRCDIR)/src/emacs
	make --directory=$(SRCDIR) install

.PHONY: all emacs
