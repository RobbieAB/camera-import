#!/bin/bash

archive="/home/robert/Pictures/Photos"

if [ ! -d "$archive" ] ; then
  echo "Archive directory does not exist."
  exit 1
fi

if [ "$#" -ne 1 ] ; then
  echo "No argument provided, or too many arguments provided."
  exit 1
fi

if [ ! -f "$1" ] ; then
  echo "File not found. Can't find file: $1."
  exit 2
fi

filedate=$( date -r "$1" +%Y-%m-%d )

destdir="$archive/$filedate"

if [ ! -e "$destdir" ] ; then
  mkdir -p "$destdir"
fi

if [ ! -d "$destdir" ] ; then
  echo "The destination exists but is not a directory"
  exit 3
fi

if [ -a "$destdir/$1" ] ; then 
  echo "$1 already exists in archive"
  exit 1
fi

cp "$1" "$destdir/"
