# Example makefile for template.md

MAKEFLAGS += -j2

NAME=template
MDS=./mds


all: $(NAME).pdf $(NAME)_handout.pdf

$(NAME).pdf: $(NAME).md $(NAME).theme
	$(MDS) -vv $<

$(NAME)_handout.pdf: $(NAME).md $(NAME).theme
	$(MDS) -vvt $<

clean:
	$(RM) $(NAME).pdf $(NAME)_handout.pdf
