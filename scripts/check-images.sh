#!/bin/bash
set -eu

cd "$(dirname "$0")/.."

errors=0
last_file=""
while IFS= read -r line; do
  file=$(echo "$line" | cut -d: -f1)
  path=$(echo "$line" | grep -oE 'file:[^]]+' | sed 's/file://;s/^\///')
  if [ "$file" != "$last_file" ]; then
    echo "Checking: $file"
    last_file="$file"
  fi
  if [ -f "static/$path" ]; then
    echo "  OK: $path"
  else
    echo "  Missing: $path"
    errors=1
  fi
done < <(grep -roHE '\[\[file:[^]]+\]\]' content/posts/*.org)

exit "$errors"
