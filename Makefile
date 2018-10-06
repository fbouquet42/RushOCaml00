RESULT = tic-tac-toe
ML= parse.ml Game.ml Board.ml
MLI= ${ML:.ml=.mli}
SOURCES = $(MLI) $(ML) main.ml
OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)
