libx509lintpq.so:
	gcc -fpic -c x509lint/checks.c -Wall -O2 -std=c99
	gcc -fpic -c x509lint/messages.c -Wall -O2 -std=c99
	gcc -fpic -c x509lint/asn1_time.c -Wall -O2 -std=c99
	gcc -fpic -c x509lintpq.c -I`pg_config --includedir-server` -std=gnu99
	gcc -shared -fpic -o libx509lintpq.so -Wl,-Bsymbolic -Wl,-Bsymbolic-functions x509lintpq.o checks.o messages.o asn1_time.o -lcrypto

install:
	su -c "cp libx509lintpq.so `pg_config --pkglibdir`"

clean:
	rm -f *.o *.so *~
