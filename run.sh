#!/bin/bash
# User arguments
BUILDDIR="/dest"
GITLAB_DOCKER_REPO=${1-registry.gitlab.com/shooktea/teamdriver}
ALL_TEMPLATE_DIR="/app/templates"

echo -n "Generating project..."

for template in $(find "$ALL_TEMPLATE_DIR"); do
  if [ ! -d "$template" ]; then
    TEMPLATEPATH=${template#*/*/*/}
    TEMPLATEDIR=$(dirname $TEMPLATEPATH)

    if [ "$TEMPLATEDIR" != "." ]; then
      mkdir -p "$BUILDDIR/$TEMPLATEDIR"
    fi
    src="/app/templates/$TEMPLATEPATH"
    dest="$BUILDDIR/$TEMPLATEPATH"
    cat $src | sed -e "s|\${GITLAB_REPO}|${GITLAB_DOCKER_REPO}|" > $dest
  fi
done

echo " done."
echo "Application image will be pushed to $1 repository"
