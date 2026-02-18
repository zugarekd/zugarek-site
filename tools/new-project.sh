#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./tools/new-project.sh "Project Title" category tag1 tag2 ...
#
# Categories: marine | distributed-systems | embedded | finance | misc

TITLE="${1:-}"
CATEGORY="${2:-misc}"
shift 2 || true
TAGS=("$@")

if [[ -z "$TITLE" ]]; then
  echo "Usage: $0 "Project Title" category [tag1 tag2 ...]"
  exit 1
fi

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g'
}

SLUG="$(slugify "$TITLE")"
DATE="$(date +%F)"
PATH_DIR="src/content/projects/${CATEGORY}"
FILE="${PATH_DIR}/${SLUG}.mdx"

mkdir -p "$PATH_DIR"

TAGS_YAML="[]"
if [[ ${#TAGS[@]} -gt 0 ]]; then
  # YAML list like ["a","b"]
  TAGS_YAML="$(printf '%s
' "${TAGS[@]}" | python - <<'PY'
import sys, json
tags=[l.strip() for l in sys.stdin if l.strip()]
print(json.dumps(tags))
PY
)"
fi

cat > "$FILE" <<EOF
---
title: "${TITLE}"
date: ${DATE}
category: ${CATEGORY}
tags: ${TAGS_YAML}
summary: "TODO: one-sentence summary (<= 240 chars)."
github: "https://github.com/yourname/yourrepo"
links:
  - label: "TODO: primary reference"
    url: "https://example.com"
---

## Goal

## Constraints

## Design / Architecture

## Build Log

## Problems Encountered

## Final Result

## Lessons Learned

EOF

echo "Created: $FILE"
