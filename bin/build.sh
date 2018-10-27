#!/bin/bash
HOME=$(realpath $(dirname $(readlink -f $0))/../)

asciidoctor $HOME/src/root.adoc -o $HOME/target/root.html

if [ "$1" != "" ]; then
  case $1 in
    -c | --chromium )
      chromium $HOME/target/root.html
      exit
      ;;
    * )
      echo "Invalid argument $1"
      exit 1
  esac
fi