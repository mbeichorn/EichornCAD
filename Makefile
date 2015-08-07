#POSIX Makefile
.POSIX:

# BMAKE POSIX FIX
.OBJDIR: $(.CURDIR)

# Macros
CC = clang
INSTALL = install

CFLAGS = -std=c11 -Weverything
LDFLAGS = 
PREFIX = /usr

EXEC = eichorncad
PROJECT = EichornCAD
VERSION = 0.0.1

# Targets
$(EXEC): obj/main.o
	$(CC) $(LDFLAGS) -o $@ obj/main.o

obj/main.o: src/main.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ src/main.c

clean:
	- rm obj/main.o
	- rmdir obj
	- rm $(EXEC)

dist:
	mkdir $(PROJECT)
	cp Makefile $(PROJECT)/
	cp LICENSE $(PROJECT)/
	cp README.md $(PROJECT)/
	cp -R src $(PROJECT)/
	tar -czf $(PROJECT)-$(VERSION).tar.gz $(PROJECT)
	rm -r $(PROJECT)

install:
	$(INSTALL) $(EXEC) $(PREFIX)/bin

uninstall:
	rm $(PREFIX)/bin/$(EXEC)
