#!/bin/bash
HOME=$(realpath $(dirname $(readlink -f $0))/../)
FILENAME="cv"

asciidoctor $HOME/src/$FILENAME.adoc -o $HOME/target/$FILENAME.html

if [ "$1" != "" ]; then
  case $1 in
    -c | --chromium )
      chromium $HOME/target/$FILENAME.html
      exit
      ;;
    * )
      echo "Invalid argument $1"
      exit 1
  esac
fi