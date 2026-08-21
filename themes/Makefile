# Makefile to create consistently commented versions of the themes

THEMEFILES=alliance/mds.theme basic/mds.theme colors/mds.theme computeontario/mds.theme hannover-albatross/mds.theme ilmenau-dolphin/mds.theme rochester-crane-structurebold/mds.theme scinet/mds.theme scinet1/mds.theme scinet2/mds.theme white43/mds.theme yellow/mds.theme

SRC=../themecomments

all: ${THEMEFILES}

../catsub:
	cd .. && wget https://raw.githubusercontent.com/vanzonr/catsub/refs/heads/master/catsub
	chmod +x ../catsub

%.theme: %.theme.template ../catsub ${SRC}/aspectratio.txt ${SRC}/colortheme.txt ${SRC}/fontfamily.txt ${SRC}/fontsize.txt ${SRC}/fonttheme.txt ${SRC}/header.txt ${SRC}/highlight.txt ${SRC}/innertheme.txt ${SRC}/logoheight.txt ${SRC}/logo.txt ${SRC}/logoup.txt ${SRC}/logowidth.txt ${SRC}/plaintitle.txt ${SRC}/themetex.txt ${SRC}/theme.txt ${SRC}/engine.txt
	../catsub $< %THEME $$(dirname $<) \
	%HEADERTXT "$$(cat ${SRC}/header.txt)" \
	%HIGHLIGHTTXT "$$(cat ${SRC}/highlight.txt)" \
	%FONTSIZETXT "$$(cat ${SRC}/fontsize.txt)" \
	%FONTFAMILYTXT "$$(cat ${SRC}/fontfamily.txt)" \
	%THEMETXT "$$(cat ${SRC}/theme.txt)" \
	%THEMETEXTXT "$$(cat ${SRC}/themetex.txt)" \
	%LOGOTXT "$$(cat ${SRC}/logo.txt)" \
	%INNERTHEMETXT "$$(cat ${SRC}/innertheme.txt)" \
	%COLORTHEMETXT "$$(cat ${SRC}/colortheme.txt)" \
	%ASPECTRATIOTXT "$$(cat ${SRC}/aspectratio.txt)" \
	%LOGOHEIGHTTXT "$$(cat ${SRC}/logoheight.txt)" \
	%LOGOUPTXT "$$(cat ${SRC}/logoup.txt)" \
	%PLAINTITLETXT "$$(cat ${SRC}/plaintitle.txt)" \
	%ENGINETXT "$$(cat ${SRC}/engine.txt)" \
	%LOGOWIDTHTXT "$$(cat ${SRC}/logowidth.txt)" \
	%FONTTHEMETXT "$$(cat ${SRC}/fonttheme.txt)" \
	> $@

clean:
	$(RM) ${THEMEFILES}
