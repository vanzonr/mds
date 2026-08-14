#!/bin/bash
set -exuo pipefail

mkdir -p testallresults
./mds -h
find themes -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d '' i; do
    ./mds -vvvt -s "$i" template.md
    if [ "${1:-}" != quick ]; then
        ./mds -dv -s "$i" template.md
        ./mds -pdv -s "$i" template.md
        ./mds -dvt -s "$i" template.md
        ./mds -vvv -s "$i" template.md
        rm -f template.pdf
    fi
    mv template_handout.pdf testallresults/$(basename $i)_handout.pdf
done
