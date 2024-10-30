mds - MarkDown Slides
=====================

`mds` generates PDF slides from extended markdown, using the external
utilities `pandoc` and `pdflatex`, using the beamer document class.
`pandoc` is a utility that can convert document from many different
text formats to other formats (see https://pandoc.org), while
`pdflatex` is the pdf version of the document preparation system LaTeX
(see e.g. https://www.tug.org/texlive).

mds is written in bash.

Prerequisites
=============
  - bash
  - pandoc
  - pdflatex

Installation
============

To install, simply clone the mds git repo, and add the directory to
the PATH environment variable.  Alternatively, you can invoke `mds`
using the full paths to its location.

Usage of `mds`
==============

  mds [OPTIONS] MARKDOWNFILE

This converts the markdown file into pdf.  MARKDOWNFILE can use
extended pandoc markdown syntax (see below).

OPTIONS:

  -d  work in draft mode; figures are included as outlines
  -v  verbose mode
  -vv more verbose mode
  -vvv most verbose mode
  -q  call quarto to execute blocks; experimental and requires additionally quarto, r and knitr.
  
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

     For unequal-width columns, or to have more columns, use the
     following more general syntax from pandoc:

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

   FONTSIZE      Desired size in points
                  default: 11

   ASPECTRATIO   Desired aspect ratio of slides
                  default: 43
                  possible values: 1610, 169, 149, 54, 43 and 32

   HIGHLIGHT     Desired syntax highlight style
                  possible values: pygments,  kate,  monochrome,
                                   espresso,  zenburn, haddock,
                                   tango
   
   THEME         The Beamer theme to use
   
   INNERTHEME    The inner theme for beamer to use

   COLORTHEME    The color theme for beamer to use
   
   THEMETEX      Additional latex code to use.

Note that the `mdsup` utility will create a .theme file in the
directory corresponding to the selected THEME.


Reporting Bugs
==============

vanzonr@gmail.com. No promisses as to whether I will have time/can fix them.

- 30 October 2024
