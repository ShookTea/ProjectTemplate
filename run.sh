#!/usr/bin/env bash
# User arguments
BUILDDIR="/dest"
GITLAB_DOCKER_REPO=${1-registry.gitlab.com/shooktea/teamdriver}
ALL_TEMPLATE_DIR="/app/templates"

for template in $(find "$ALL_TEMPLATE_DIR"); do
  if [ ! -d "$template" ]; then
    TEMPLATEPATH=${template#*/*/}
    TEMPLATEDIR=$(dirname $TEMPLATEPATH)

    if [ "$TEMPLATEDIR" != "." ]; then
      mkdir -p "$BUILDDIR/$TEMPLATEDIR"
    fi
    src="$TEMPLATEPATH"
    dest="$BUILDDIR/$TEMPLATEPATH"
    echo "Copying '$src' to '$dest'..."
    cat $src | sed -e "s|\${GITLAB_REPO}|${GITLAB_DOCKER_REPO}|" > $dest
  fi
done
