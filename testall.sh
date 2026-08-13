#!/bin/bash
set -exuo pipefail
mkdir -p testallresults
find themes -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d '' i; do
    ./mds -vvv -s "$i" template.md
    ./mds -vvvt -s "$i" template.md
    mv template.pdf testallresults/$(basename $i).pdf
    mv template_handout.pdf testallresults/$(basename $i)_handout.pdf
done
