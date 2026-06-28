#!/bin/bash

set -e

POSTS_DIR="$(dirname "$0")/_posts"
DATE=$(date +%Y-%m-%d)

TITLE="${1:-}"
if [ -n "$TITLE" ]; then
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')
    FILENAME="$POSTS_DIR/$DATE-$SLUG.md"
else
    FILENAME="$POSTS_DIR/$DATE.md"
fi

if [ -f "$FILENAME" ]; then
    echo "File already exists: $FILENAME"
    exit 1
fi

cat > "$FILENAME" << EOF
---
layout: post
title: "$TITLE"
date: $DATE
tags: daily
---

EOF

echo "Created: $FILENAME"
