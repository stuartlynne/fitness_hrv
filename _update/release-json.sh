#!/bin/bash

GITHUB_REPO="https://github.com/stuartlynne/fitness_hrv/releases/download/"

RELEASES=$(gh release list -R git@github.com:stuartlynne/fitness_hrv.git | sed -e 's/\t/ /g' -e 's/.* \(.*\) .*/\1/')

# echo '{"fitness_ecg": "abc", "fitness_dashboard": "def"}' | python -m json.tool

(
    /bin/echo "{ "

    for R in $RELEASES; do
        ASSETS=$(gh release view -R git@github.com:stuartlynne/fitness_hrv $R | sed -n -e 's/asset:\t//p')
        for A in $ASSETS; do
            echo "\"${A}\" : \"${GITHUB_REPO}/${R}/${A}\", "
        done
        break
    done

    echo "\"date\" : \"$(date)\" "

    /bin/echo  " }"
) | python -m json.tool

