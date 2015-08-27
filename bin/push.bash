#!/bin/bash
# push leetcode to github and coding
if git remote show origin;then
    git push origin master:master
fi
if git remote show coding; then
    git push coding master:master
fi
if git remote show github; then
    git push github master:master
fi
