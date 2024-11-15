mds - MarkDown Slides
=====================

`mds` generates PDF slides from extended markdown, using the external
utilities `pandoc` and `pdflatex`, using the beamer document class.
`pandoc` is a utility that can convert document from many different
text formats to other formats (see https://pandoc.org), while
`pdflatex` is the pdf version of the document preparation system LaTeX
(see e.g. https://www.tug.org/texlive).

It also uses the substitution utility `catsub`, which is included as a
git submodule.

mds is written in bash.

Prerequisites
=============
  - bash
  - pandoc
  - pdflatex
  - python (for catsub)

Installation
============

To install, simply clone the `mds` git repository including the submodule `catsub`:

```
git clone --recursive https://github.com/vanzonr/mds 
```

and add the directory to the PATH environment variable.

Alternatively, you can invoke `mds`
using the full paths to its location, or copy `mds` and `catsub` to the directory containing your markdown source.

Usage of `mds`
==============

  mds [OPTIONS] MARKDOWNFILE

This converts the markdown file into pdf.  MARKDOWNFILE can use
extended pandoc markdown syntax (see below).

OPTIONS:

  * -d  work in draft mode; figures are included as outlines
  * -v  verbose mode
  * -vv more verbose mode
  * -vvv most verbose mode
  * -t produce a handout version
  * -q  call quarto to execute blocks; experimental and requires additionally quarto, r and knitr.
  
Extended Markdown Syntax
=========================

The markdown syntax is specified here:

  https://pandoc.org/MANUAL.html#pandocs-markdown

The highest level headers that are present in the markdown text file
and that contain some content, are the ones that start a new slide
(with that header as the title).  If the highest levels have no
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
     centered.  Multiline centering is not yet supported.

  3. Graphics size control

     The default size of graphics on beamer slides is the full width
     of the slide or column.  To adjust this, the command
     `\setrelfigwidth{fraction}` will set the size to the given
     fraction of the slide width. `\setrelfigheight{fraction}` does
     the same for the height.  Both commands may be necessary to force
     a picture to be enlarged beyond about 1/2 the size of the slide.

     Current pandoc versions support a better syntax for this, using `{width=X%}` or `{height=X%}` following the `![](FILENAME)`.
    
  4. Adding empty lines with `.`

     Standard markdown does not have a way to indicate that a line is
     empty but should nonetheless tak up vertical space.  With mds, a
     single period on a line has that effect. Whitespace around the
     period is allowed.

  5. Alert delineators `****`

     A generalization of the italics delinearor `*` and the bold
     delineator `**`, phrases between `****` will be rendered in
     'alert' style, typically rendered in a different color that
     stands out.

  6. Overlays

     Parts of a slide can be show in parts. To indicate that a part
     should only be show in overlay number X, surround that part with
     `@ @ @ X` and `@ @ @ @`.

     Note that pandoc already supplies a syntax to incrementally show
     subsequent parts of a slide. Use `. . .` (note the spaces) to
     "pause" the slide at point.  Pauses will not be present in the
     "handout" version of the slides.

Themes
======

For customization of the theme of the slides, `mds` looks for a file
in the same directory as the markdown file, and with the same name
except with the extension .theme instead of .md . It can contain
assignments of the form SETTING=VALUE. The possible SETTINGs are:

| Option      |  Default value |  Meaning                                                      
|-------------|----------------|-----------------------------------------------------------
| HIGHLIGHT   |  zenburn       |  Syntax highlight style                    
| ASPECTRATIO |  169           |  Slide aspect ratio (1610, 169, 149, 54, 43 or 32)
| LOGO        |                |  Path to a file containing the botton-right logo    
| LOGOHEIGHT  |  0.1           |  Size of logo relative to the height
| LOGOWIDTH   |                |  Size of logo relative to the width
| LOGOUP      |                |  Relative amount to move the logo up (allowed to be negative)
| LOGOONTITLE |  true          |  Whether the logo should appear on the title page
| FONTFAMILY  |                |  Name of an installed font
| FONTSIZE    |  9pt           |  Size of the font
| THEME       |  Boadilla      |  Beamer theme to use
| INNERTHEME  |  rounded       |  Beamer 'inner' theme to use
| FONTTHEME   |  structurebold |  Beamer 'font' theme to use    
| COLORTHEME  |  orchid        |  Beamer 'color' theme to use
| HANDOUT     |  false         |  When set to true, omits overlays (e.g. ". . ." pauses)
| ENGINE      |  pdflatex      |  Program to use to generate the pdf from the LaTeX intermediate
| THEMETEX    |  style.tex     |  Additional latex to add in the LaTeX preamble


Reporting Bugs
==============

vanzonr@gmail.com. No promisses as to whether I will have time/can fix them.

- 30 October 2024
