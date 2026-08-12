mds - MarkDown Slides
=====================

`mds` generates PDF slides from extended markdown, using the external
utilities `pandoc` and `pdflatex`, using the beamer document class.
`pandoc` is a utility that can convert document from many different
text formats to other formats (see https://pandoc.org), while
`pdflatex` is the pdf version of the document preparation system LaTeX
(see e.g. https://www.tug.org/texlive).

For some themes, mds also uses the substitution utility `catsub`,
which is downloaded if not present.

Quarto support is experimental and requires additionally quarto, r and
knitr.

`mds`  is written in bash.

Prerequisites
=============
  - bash
  - pandoc
  - latex (incl. the pdflatex and xelatex commands)
  - python (for catsub, only if using THEMETEX_ variables)
  - quarto, r, knitr (only if using quarto)

Installation
============

To install, simply clone the `mds` git repository:

```
git clone https://github.com/vanzonr/mds 
```

and add the directory of the mds script to the PATH environment variable.

Alternatively, you can invoke `mds` using the full paths to its
location, or copy `mds` to the directory containing your markdown
source.

Usage of `mds`
==============

`mds [OPTIONS] MARKDOWNFILE.md`

This converts the markdown file into pdf. MARKDOWNFILE.md can use
extended pandoc markdown syntax (see below).

OPTIONS:

  * `-h`          show this help
  * `-q`          pass through quarto for executable blocks
  * `-d`          work in draft mode; figures are included as outlines
  * `-t`          produce a handout version
  * `-p`          preserve the intermediate latex file that pandoc produces
  * `-v`          verbose mode
  * `-vv`         more verbosity
  * `-vvv`        more verbosity and show latex output
  * `-s STYLEDIR` where to find the .theme.sh file and other theme files

If no `STYLEDIR` or `MARKDOWNFILE.theme` directory exists, one is created,
and populated with an example theme consisting of three files:
`settings.theme.sh`, `preamble.theme.tex`, and `logo.png`.  These files can
be edited to change the look of the slides.

The resulting pdf is stored in `MARKDOWNFILE.pdf` or in
`MARKDOWNFILE_handout` in handout mode.

Extended Markdown Syntax
=========================

The markdown syntax is specified here:

  https://pandoc.org/MANUAL.html#pandocs-markdown

The highest level headers that are present in the markdown text file
and that contain some content, are the ones that start a new slide
(with that header as the title). If the highest levels have no
content before a next-level header, they become section headers.

In addition to standard markdown syntax that comes from pandoc, the
following extensions are implemented in `mds`:

  1. Column delineators '[[', '||', and ']]'.

     [[ indicates the beginning of a set of columns.
     || is the separator between columns 
     ]] indicates the end of a set of columns.

     These two-character delineators should appear on a single line
     by themselves. No tabs or spaces are allowed.

     You can have any number of columns.

     For unequal-width columns, you can use more `|` characters to
     increase the relative size of the next column.
     
     You can also use the following more general syntax from pandoc:

         ::::::{.columns}
         :::{.column width=0.3}
         LEFT COLUMN 
         :::
         :::{.column width=0.7}
         RIGHT COLUMN
         :::
         ::::::

  2. Centering delineators '->' and '<-'.

     Anything between these two delineators on the same line gets
     centered. Multiline centering is not yet supported.

  3. Graphics size control

     The default size of graphics on beamer slides is the full width
     of the slide or column. To adjust this, the command
     `\setrelfigwidth{fraction}` will set the size to the given
     fraction of the slide width. `\setrelfigheight{fraction}` does
     the same for the height. Both commands may be necessary to force
     a picture to be enlarged beyond about 1/2 the size of the slide.

     Current pandoc versions support a better syntax for this,
     using `{width=X%}` or `{height=X%}` following the `![](FILENAME)`.
    
  4. Adding empty lines with `.`

     Standard markdown does not have a way to indicate that a line is
     empty but should nonetheless take up vertical space. With mds, a
     single period on a line has that effect. Whitespace around the
     period is allowed.

  5. Alert delineators `****`

     A generalization of the italics delineator `*` and the bold
     delineator `**`, phrases between `****` will be rendered in
     'alert' style, typically rendered in a different color that
     stands out.

  6. Overlays

     Parts of a slide can be show in parts. To indicate that a part
     should only be show in overlay number X, surround that part with
     lines containing `@ @ @ X` and `@ @ @ @`.

     Note that pandoc already supplies a syntax to incrementally show
     subsequent parts of a slide. Use `. . .` (note the spaces) to
     "pause" the slide at point. Pauses will not be present in the
     "handout" version of the slides.

An example using all these extensions is provided in the file
`template.md`.

Themes
======

For customization of the theme of the slides, `mds` looks in the
`STYLEDIR` directory (i.e., the argument of the `-s` option), or in a
directory with the same name as the markdown file except with the
extension .theme instead of .md . This directory should contain a file
with extension `.theme.sh` containing assignments of the form
SETTING=VALUE. The possible SETTINGs are:

| Option      |  Default value      |  Meaning                                                      
|-------------|---------------------|-----------------------------------------------------------
| HIGHLIGHT   |  zenburn            |  Syntax highlight style                    
| ASPECTRATIO |  169                |  Slide aspect ratio (1610, 169, 149, 54, 43 or 32)
| LOGO        |                     |  Path to a file containing the botton-right logo    
| LOGOHEIGHT  |  0.1                |  Size of logo relative to the height
| LOGOWIDTH   |                     |  Size of logo relative to the width
| LOGOUP      |                     |  Relative amount to move the logo up (allowed to be negative)
| LOGOONTITLE |  true               |  Whether the logo should appear on the title page (deprecated, equivalent to the opposite of PLAINTITLE)
| PLAINTITLE  |  false              |  Whether the title page should not have the theme of regular slides (with logo etc.)
| FONTFAMILY  |                     |  Name of an installed font
| FONTSIZE    |  9pt                |  Size of the font
| THEME       |  Boadilla           |  Beamer theme to use
| INNERTHEME  |  rounded            |  Beamer 'inner' theme to use
| FONTTHEME   |  structurebold      |  Beamer 'font' theme to use    
| COLORTHEME  |  orchid             |  Beamer 'color' theme to use
| HANDOUT     |  false              |  When set to true, omits overlays (e.g. ". . ." pauses)
| ENGINE      |  pdflatex           |  Program to use to generate the pdf from the LaTeX intermediate
| THEMETEX    |  preamble.theme.tex |  Additional latex to add in the LaTeX preamble

You can use the variable $HERE in this .theme.sh file to refer to the
directory of the .theme file; this way, you can easily refer to other
file, e.g. images, in the same theme directory.

A number of example themes can be found in the `themes/` directory of
this repo. These directories can be used directory by mds by giving
their path as the argument to the `-s` option.

You can test all example themes on `template.md` with the `testall.sh`
script, which will put the results in a directory called
`testallresults`.

Reporting Bugs
==============

vanzonr@gmail.com. No promisses as to whether I will have time/can fix them.

- 12 August 2026
