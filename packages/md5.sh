#!/bin/sh
for i in *.dmg ; do
  md5 $i > $i.md5
done
