# Makefile to create consistently commented versions of the themes

%.theme: %.theme.sh 
	../catsub $< %THEME $$(dirname $<) \
	%HEADERTXT "$$(cat header.txt)" \
	%HIGHLIGHTTXT "$$(cat highlight.txt)" \
	> $@
