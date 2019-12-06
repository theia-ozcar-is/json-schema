#!/bin/bash
for file in /usr/share/nginx/html/*.json
do
  envsubst '${JSON_SCHEMA_API_URL}' < "$file" > "$file.tmp"
  mv "$file.tmp" "$file"
done
exec "$@"