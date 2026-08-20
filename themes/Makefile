# Makefile to create consistently commented versions of the themes

THEMEFILES=alliance/mds.theme basic/mds.theme colors/mds.theme computeontario/mds.theme hannover-albatross/mds.theme ilmenau-dolphin/mds.theme rochester-crane-structurebold/mds.theme scinet/mds.theme scinet1/mds.theme scinet2/mds.theme white43/mds.theme yellow/mds.theme

all: ${THEMEFILES}

%.theme: %.theme.template aspectratio.txt colortheme.txt fontfamily.txt fontsize.txt fonttheme.txt header.txt highlight.txt innertheme.txt logoheight.txt logo.txt logoup.txt logowidth.txt plaintitle.txt themetex.txt theme.txt engine.txt
	../catsub $< %THEME $$(dirname $<) \
	%HEADERTXT "$$(cat header.txt)" \
	%HIGHLIGHTTXT "$$(cat highlight.txt)" \
	%FONTSIZETXT "$$(cat fontsize.txt)" \
	%FONTFAMILYTXT "$$(cat fontfamily.txt)" \
	%THEMETXT "$$(cat theme.txt)" \
	%THEMETEXTXT "$$(cat themetex.txt)" \
	%LOGOTXT "$$(cat logo.txt)" \
	%INNERTHEMETXT "$$(cat innertheme.txt)" \
	%COLORTHEMETXT "$$(cat colortheme.txt)" \
	%ASPECTRATIOTXT "$$(cat aspectratio.txt)" \
	%LOGOHEIGHTTXT "$$(cat logoheight.txt)" \
	%LOGOUPTXT "$$(cat logoup.txt)" \
	%PLAINTITLETXT "$$(cat plaintitle.txt)" \
	%ENGINETXT "$$(cat engine.txt)" \
	%LOGOWIDTHTXT "$$(cat logowidth.txt)" \
	%FONTTHEMETXT "$$(cat fonttheme.txt)" \
	> $@

clean:
	$(RM) ${THEMEFILES}
