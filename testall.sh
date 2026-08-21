#!/bin/bash
set -exuo pipefail

./mds -h

pushd themes
make all
popd

mkdir -p testallresults

find themes -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d '' i; do
    ./mds -vvv -s "$i" example/template.md
    mv example/template.pdf testallresults/$(basename $i).pdf
    if [ "${1:-}" != quick ]; then
        ./mds -dv -s "$i" example/template.md
        ./mds -pdv -s "$i" example/template.md
        ./mds -v -s "$i" example/template.md
        ./mds -dvt -s "$i" example/template.md
        ./mds -vvvt -s "$i" example/template.md
        rm -f example/template_handout.pdf
    fi
done
