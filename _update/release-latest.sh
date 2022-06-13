#!/bin/bash

#gh release list -R git@github.com:stuartlynne/fitness_hrv.git | cat
#gh release view -R git@github.com:stuartlynne/fitness_hrv v0.13-alpha | cat

#[Fitness\_Dashboard v0.13](https://github.com/stuartlynne/fitness_hrv/releases/download/v0.13-alpha/Fitness_Dashboard_0.13_setup.exe)
#<ul>
#  <li><a href="https://github.com/stuartlynne/fitness_hrv/releases/download/v0.14-alpha/Fitness_Dashboard_0.14_setup.exe">
#    <strong> Fitness_Dashboard v0.14 </strong></a></li>
#  <li><a href="https://github.com/stuartlynne/fitness_hrv/releases/download/v0.14-alpha/Fitness_ECG_0.14_setup.exe">
#    <strong> Fitness_ECG v0.14 </strong></a></li>
#</ul>

GITHUB_REPO="https://github.com/stuartlynne/fitness_hrv/releases/download/"

RELEASES=$(gh release list -R git@github.com:stuartlynne/fitness_hrv.git | sed -e 's/\t/ /g' -e 's/.* \(.*\) .*/\1/')

#echo "<p><a href="dowloads.html"><strong>Downloads</strong></a></p>"
echo "<p><strong>Downloads</strong></p>"

for R in $RELEASES; do
    ASSETS=$(gh release view -R git@github.com:stuartlynne/fitness_hrv $R | sed -n -e 's/asset:\t//p')
    echo "      <ul>"
    for A in $ASSETS; do
        echo "        <li><a href=\"${GITHUB_REPO}/${R}/${A}\"><strong> ${A} </strong></a> </li>"
    done
    echo "      </ul>"
    break
done


