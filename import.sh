#!/bin/sh

archive(){
  local arcdir="/home/robert/Pictures/Photos"

  if [ ! -d "$arcdir" ] ; then
    echo "Archive directory does not exist."
    return 1
  fi

  if [ "$#" -ne 1 ] ; then
    echo "No argument provided, or too many arguments provided."
    return 1
  fi

  if [ ! -f "$1" ] ; then
    echo "File not found. Can't find file: $1."
    return 2
  fi

  local filedate=$( date -r "$1" +%Y-%m-%d )
  local destdir="$arcdir/$filedate"

  if [ ! -e "$destdir" ] ; then
    mkdir -p "$destdir"
  fi

  if [ ! -d "$destdir" ] ; then
    echo "The destination exists but is not a directory"
    return 3
  fi

  if [ -a "$destdir/$1" ] ; then 
    echo "$1 already exists in archive"
    return 1
  fi

  cp "$1" "$destdir/"
}

archive $1
