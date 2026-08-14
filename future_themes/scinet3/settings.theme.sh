HIGHLIGHT=zenburn
ASPECTRATIO=169
FONTSIZE=10pt
THEME=Boadilla
INNERTHEME=rounded
FONTTHEME=structurebold
COLORTHEME=orchid
if [ $HANDOUT = true ]
then
    THEMETEX=$HERE/style_handout.tex
else
    THEMETEX=$HERE/style.tex
fi
LOGO=$HERE/scinetlogodark2.png
THEMETEX_HERE=$HERE
LOGOHEIGHT=0.15
LOGOUP=-0.03
