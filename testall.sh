#!/bin/bash
set -exuo pipefail

./mds -h

pushd themes
make all
popd

mkdir -p testallresults

find themes -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d '' i; do
    ./mds -vvv -s "$i" template.md
    mv template.pdf testallresults/$(basename $i).pdf
    if [ "${1:-}" != quick ]; then
        ./mds -dv -s "$i" template.md
        ./mds -pdv -s "$i" template.md
        ./mds -v -s "$i" template.md
        ./mds -dvt -s "$i" template.md
        ./mds -vvvt -s "$i" template.md
        rm -f template_handout.pdf
    fi
done
