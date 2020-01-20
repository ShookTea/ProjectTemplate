#!/usr/bin/env bash
# User arguments
BUILDDIR=${1-build}
GITLAB_DOCKER_REPO=${2-registry.gitlab.com/shooktea/teamdriver}
ALL_TEMPLATE_DIR="/app/templates"

# Current user directory
USERDIR="$(pwd -P)"
FULLDIR="$USERDIR/$BUILDDIR"

if [ -f "$FULLDIR" ]; then
  echo "$FULLDIR already exists"
  exit
fi
if [ -d "$FULLDIR" ]; then
  echo "$FULLDIR already exists"
  exit
fi

echo "Creating directory $FULLDIR..."
mkdir -p $FULLDIR

for template in $(find "$ALL_TEMPLATE_DIR"); do
  if [ ! -d "$template" ]; then
    TEMPLATEPATH=${template#*/*/}
    TEMPLATEDIR=$(dirname $TEMPLATEPATH)

    if [ "$TEMPLATEDIR" != "." ]; then
      mkdir -p "$FULLDIR/$TEMPLATEDIR"
    fi
    src="templates/$TEMPLATEPATH"
    dest="$FULLDIR/$TEMPLATEPATH"
    echo "Copying '$src' to '$dest'..."
    cat $src | sed -e "s|\${GITLAB_REPO}|${GITLAB_DOCKER_REPO}|" > $dest
  fi
done
