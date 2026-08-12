#!/bin/bash
set -exuo pipefail
mkdir -p testallresults
for i in $(find themes -mindepth 1 -maxdepth 1 -type d); do
    ./mds -v -s "$i" template.md
    ./mds -vt -s "$i" template.md
    mv template.pdf testallresults/$(basename $i).pdf
    mv template_handout.pdf testallresults/$(basename $i)_handout.pdf
done
