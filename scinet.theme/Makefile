NAME=scinet
MDS=../mds

all: $(NAME).pdf $(NAME)_handout.pdf

$(NAME).pdf: $(NAME).md logos.png style.theme style.tex
	$(MDS) -vv $<

$(NAME)_handout.pdf: $(NAME).md logos.png style.theme style.tex
	$(MDS) -vvt $<

clean:
	$(RM) $(NAME).pdf $(NAME)_handout.pdf $(NAME).tex $(NAME)_handout.tex
