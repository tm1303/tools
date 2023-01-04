#! /usr/bin/env bash

merged=`git branch -r --merged| sed /\*/d`
#echo "$merged"

for k in $merged; do
  if (($(git log -1 --since='1 year ago' -s $k|wc -l)==0));
  then
    shortname=`echo $k | sed s.origin/..g`
    echo "$shortname will be deleted"
    echo "git push origin --delete $shortname" >> prunes
#  else
#    echo "$k will NOT be deleted"
  fi
done
