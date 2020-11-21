DESTDIR = /usr/local/bin
DESKTOPDIR = /usr/share/applications

install:
	cp dama ${DESTDIR}/dama
	chmod 755 ${DESTDIR}/dama
	cp dama.desktop ${DESKTOPDIR}

uninstall:
	rm ${DESTDIR}/dama
	rm ${DESKTOPDIR}/dama.desktop
