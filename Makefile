all:
	dune build main.exe

clean:
	dune clean

test:
	$(MAKE) -C test

.PHONY: all clean test
