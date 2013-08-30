#!/usr/bin/env sh

git add .
date=`date`
git commit -am "$1 :$date"
git pull
git push

