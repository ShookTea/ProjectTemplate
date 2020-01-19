#!/usr/bin/env bash
# Current user directory
USERDIR="$(pwd -P)"
BUILDDIR=${1-build}
FULLDIR="$USERDIR/$BUILDDIR"

if [ -f "$FULLDIR" ]; then
  echo "$FULLDIR already exists"
  exit
fi
if [ -d "$FULLDIR" ]; then
  echo "$FULLDIR already exists"
  exit
fi

for template in $(find $(dirname $0)/templates); do
  if [ ! -d "$template" ]; then
    TEMPLATEPATH=${template#*/*/}
    TEMPLATEDIR=$(dirname $TEMPLATEPATH)

    if [ "$TEMPLATEDIR" != "." ]; then
      mkdir -p "$FULLDIR/$TEMPLATEDIR"
    fi
    echo "$TEMPLATEPATH in $TEMPLATEDIR"
  fi
done
