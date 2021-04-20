
MAIN = turing

exec: 
	dune exec $(MAIN)

build: lib/*
	dune build

docs: build
	dune build @doc
	rm -rf docs/*
	cp -r _build/default/_doc/_html/* docs/ 
	rm -rf _build/default/_doc/

