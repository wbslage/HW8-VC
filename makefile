CC=gcc -g
TARGETS=ma ma2 ma.shared ma2.shared
CFLAGS=-O2
LDFLAGS=-L. -lcma
STATIC=libcma.a
SHARED=libcma.so
DIRNAME=$$(pwd)
BASE=`basename $(DIRNAME)`
.PHONY: clean

all: $(TARGETS)

.c.o:
	@echo Building $?
	$(CC) $(CFLAGS) -c $?
cma.o: cma.c
	$(CC) -c cma.c

$(STATIC): cma.o
	$(AR) r $@ $?

$(SHARED): cma.o
	$(CC) -shared -o $@ $?

ma.shared: ma.o $(SHARED)
	$(CC) -o $@ ma.o $(LDFLAGS)

ma2.shared: ma2.o $(SHARED)
	$(CC) -o $@ ma2.o $(LDFLAGS)

ma: ma.o $(STATIC)
	$(CC) -static -o ma ma.o $(STATIC)

ma2: ma2.o $(STATIC)
	$(CC) -static -o ma2 ma2.o $(STATIC)

dist: clean
	tar -cvf cma_new.tar ../$(BASE)

clean:
	-rm *.o
	-rm $(TARGETS)
	-rm $(STATIC) $(SHARED)

