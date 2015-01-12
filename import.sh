#!/bin/sh

archive(){
  # Returns the following error codes:
  #  1 - No argument provided, or too many arguments provided.
  #  2 - File not found.
  #  3 - Archive directory does not exist.
  #  4 - The archive directory exists but is not a directory.
  #  5 - File already exists in archive.

  local arcdir="/home/robert/Pictures/Photos"

  if [ "$#" -ne 1 ] ; then
    return 1
  fi

  if [ ! -f "$1" ] ; then
    return 2
  fi

  local filedate=$( date -r "$1" +%Y-%m-%d )

  if [ ! -d "$arcdir" ] ; then
    return 3
  fi

  local destdir="$arcdir/$filedate"

  if [ ! -e "$destdir" ] ; then
    mkdir -p "$destdir"
  fi

  if [ ! -d "$destdir" ] ; then
    return 4
  fi

  if [ -a "$destdir/$1" ] ; then 
    return 5
  fi

  cp "$1" "$destdir/"
}

archive $1
