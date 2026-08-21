# Example makefile

MAKEFLAGS += -j2
NAME = example/template
MDS = ./mds

all: themes example testall

themes:
	make -C themes

example: $(NAME).pdf $(NAME)_handout.pdf

test:
	./testall.sh quick

testall:
	./testall.sh

$(NAME).pdf: $(NAME).md
	$(MDS) -vv $<

$(NAME)_handout.pdf: $(NAME).md
	$(MDS) -vvt $<

clean:
	$(RM) $(NAME).pdf $(NAME)_handout.pdf
	$(RM) -r testallresults
	if [ -f catsub ]; then $(RM) catsub; fi
	cd themes && make clean
