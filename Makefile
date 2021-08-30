.DEFAULT_GOAL := all
CC=gcc

mptcpize:
	$(CC) -o mptcpize mptcpize.c

mptcpwrap:
	$(CC) -shared -o libmptcpwrap.so -fPIC mptcpwrap.c

.PHONY : all
all: mptcpize mptcpwrap

install: all
	install -d $(DESTDIR)/usr/bin/
	install -m 755 mptcpize $(DESTDIR)/usr/bin/
	install -d $(DESTDIR)/usr/lib/mptcpize/
	install -m 644 libmptcpwrap.so $(DESTDIR)/usr/lib/mptcpize/
