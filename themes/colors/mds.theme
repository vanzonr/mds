# ---------------------------------------------------------------------
# mds.theme
#
# This file describes the theme configuration settings to be used by
# the markdown-to-slides utility mds.
#
# Syntax:
#  - Lines containing "SETTING=VALUE" (i.e., bash-style assignment)
#  - No spaces are allowed around the equal signs.
#  - VALUEs containing space(s) should be surrounded by quotation marks.
#  - Empty lines and comments starting with # are allowed.
#  - Some bash constructs like "if [ A = B ]" might work.
#
# Lines starting with '#' are comments and otherwise ignored by mds.
#
# Any SETTING that start with THEMETEX_ relies on the implementation in
# the file $THEMETEX (usually mds.tex).
#
## --------------------------------------------------------------------
## This file belongs to the 'colors' theme.
## --------------------------------------------------------------------


# This setting determines the relative width and height of the slides.
#
# Possible values are: 1610, 169, 149, 54, 43 or 32.
#
# Default value: 169, which means a width:height ratio of 16:9.

ASPECTRATIO=169

# This setting selects the overall beamer theme of the slides.
#
# Possible values: Antibes, Bergen, Boadilla, boxes, default,
# Goettingen, Hannover, Madrid, Marburg, Pittsburgh, Rochester,
# AnnArbor, Berkeley, Berlin, CambridgeUS, Copenhagen, Darmstadt,
# Dresden, Frankfurt, Ilmenau, JuanLesPins, Luebeck, Malmoe,
# Montpellier, PaloAlto, Singapore, Szeged, and Warsaw.
#
# Default value: default
#
## Note: The current theme ('colors') only works well with one of the
## following themes: Antibes, Bergen, Boadilla, boxes, default,
## Goettingen, Hannover, Madrid, Marburg, Pittsburgh, Rochester (why?)

THEME=default

# This setting selects the overall beamer color theme of the slides.
#
# Possible values: albatross, beaver, beetle, crane, default, dolphin,
# dove, fly, lily, orchid, rose, seagull, seahorse, sidebartab,
# structure, whale, and wolverine
#
# Default value: default

COLORTHEME=default

# This setting determines the highlight style for code blocks,
#
# Possible values values may depend on the installed version of
# pandoc, but typically are: pygments, tango, espresso, zenburn, kate,
# monochrome, breezedark, haddock
#
# Default value: zenburn

HIGHLIGHT=pygments

# This setting determines the size of the font of the regular text in
# the slides; the font size of the titles will scale accordingly.
#
# Possible values: 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, 20pt
#
# Default value: 9pt

FONTSIZE=10pt

# This setting determines the font used for all text.
# When left empty, uses standard LaTeX fonts, which can be further
# tweaks with the FONTTHEME setting (see below).
#
# Possible values are the names of an installed TTF font. Fairly
# commonly installed options are: Arial, Arial Black, Comic Sans MS,
# Georgia, Impact, Times New Roman, Trebuchet MS, and Verdana
#
# Default value: empty
#
## Note: For the current theme ('colors'), the section title font can be
## set separately with the THEMETEX_TITLEFONTFAMILY setting below.

FONTFAMILY="Arial"

# This setting tweaks the theme for titles. By setting it to
# structurebold, you get bold titles with the font specified above,
# otherwise, set it to default.
#
# If the FONTFAMILY is set to default or not set, further options are
# structureitalicserif (for a serif font in titles),
# structuresmallcapsserif (for a small-caps font in titles), serif
# (for a serif font throughout the slides), and sansserif (for a sans
# serif font throughout the slides).
#
# Default value: structurebold

FONTTHEME=structurebold 

# This setting specifies the logo to put on every slide. You can
# change the location and size with other settings, see below.
#
# The value must be an existing image file. You can use the "$HERE"
# variable to point at files in the same directory as this
# theme file. 
#
# Default value: <empty> (i.e. no logo)

LOGO=$HERE/images/logo.png

# This setting determines whether the logo should appear on the title
# slide (i.e., the first slide).
#
# If the value is true, the logo will be removed from the first slide,
# if it false, the logo will appear.
#
# Default value: false (i.e. logo appears on the title page)

PLAINTITLE=true

# This setting specifies the height of the logo relative to the height
# of the slide. Only either LOGOHEIGHT or LOGOWIDTH (see below)
# should be set. The aspect ratio of the logo cannot be changed.
#
# Possible values are decimal number between 0 and 1
# (although larger values than 1 may work to a certain extent).
#
# Default value: 0.1

LOGOHEIGHT=0.17

# This setting specifies the width of the logo relative to the width
# of the slide. Only either LOGOHEIGHT (see above) or LOGOWIDTH should
# be set. The aspect ratio of the logo cannot be changed.
#
# Possible values are decimal number between 0 and 1
# (although larger values than 1 may work to a certain extent).
#
# Default value: <empty>

# LOGOWIDTH=0.3 # for example

# This setting specifies how much the logo should be moved up from the
# bottom, relative to the height of the slide. The logo always sits at
# the bottom right, but can be moved up with this setting.
#
# Possible values are decimal number between 0 and 1
# (although larger values than 1 may work to a certain extent).
#
# Default value: <empty>

# LOGOUP=0.3

# This setting determines the 'inner theme' of the slides (from
# beamer), e.g., what boxes and list bullets look like.
#
# Possible values: default, circles, rectangles, rounded, and inmargin.
#
# Default value: rounded
#
# Note: The inmargin value works best with default, Madrid, Antibes,
# and Berkeley themes and presents issues with Hannover, Goettingen
# and Marburg themes.

INNERTHEME=rectangles

# This setting determines which file to use to add to the "LaTeX
# preamble". Such a preamble allows a lot of tweaking of the
# style. This file will be read by latex, but usually contains
# parameters that can be set here in the theme file. Note the use of
# $HERE/ which allows points to the same directory as this theme file.
#
# Default value: <empty>

THEMETEX=$HERE/mds.tex

## The remaining options are parameters for the $THEMETEX file.

## This THEMETEX setting detemines what image to use as the
## background for the title slide. Must be set to a valid image file.

THEMETEX_TITLEIMAGE=$HERE/images/firstslide.png

## This THEMETEX setting detemines what image to use as the
## background for the section slides. Must be set to a valid image file.

THEMETEX_SECTIONIMAGE=$HERE/images/sectionslide.png

## This THEMETEX setting detemines what color to use as the
## background for the regular slides. Must be set to a comma separated
## triplet of fractional values for the red, green, and blue levels of
## the color.

THEMETEX_BACKGROUNDCOLOR=0.9,0.9,0.9

## This THEMETEX setting detemines what color to use as the
## foreground on the regular slides. Must be set to a comma separated
## triplet of fractional values for the red, green, and blue levels of
## the color.

THEMETEX_FOREGROUNDCOLOR=0.0,0.0,0.0

## This THEMETEX setting detemines what font to use for slide and
## section titles. Must be set to a valid, installed font.

THEMETEX_TITLEFONTFAMILY="Ubuntu Light"
