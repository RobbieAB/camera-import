#!/bin/sh

find $1 -type f ! -exec ./import.sh {} \; -print
