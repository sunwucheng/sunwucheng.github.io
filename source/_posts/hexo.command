#!/bin/bash

cd /Users/myth/page
hexo clean
git add .
git commit -m 'auto hexo push'
git push origin hexo
hexo g -d
hexo clean

osascript -e 'tell application"Terminal" to close (every window whose name contains".command")' &
exit
