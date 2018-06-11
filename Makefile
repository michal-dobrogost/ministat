BIN = ministat 
SRCS= ministat.c
OBJS= ministat.o
MAN = ministat.1

PKGS = 

CFLAGS  += -g -Wall -Werror
CPPFLAGS+= -I. -D_GNU_SOURCE
LIBS     = -lm

DESTDIR =
PREFIX ?= /usr

# No user serviceable parts below this line.
#PPFLAGS+= $(shell pkg-config --silence-errors --cflags $(PKGS))
#LDFLAGS += $(shell pkg-config --silence-errors --libs $(PKGS))

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(OBJS) ${LDFLAGS} -o ${BIN} $(LIBS)

$(OBJS): $(OBJS:.o=.c)
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $<

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(PREFIX)/share/man/man1
	install -m 0755 $(BIN) $(DESTDIR)$(PREFIX)/bin/$(BIN)
	install -m 0644 $(MAN) $(DESTDIR)$(PREFIX)/share/man/man1/$(MAN)

clean:
	-rm -rf $(BIN) *.o *.core

.PHONY: install clean
