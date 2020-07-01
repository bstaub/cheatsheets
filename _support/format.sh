#!/usr/bin/env bash

for fn in "$@"; do
  echo "==> $fn"
  cat "$fn" \
    | yarn run -s prettier --stdin-filepath 'file.md' \
    | tr '\n' '\r' \
    | sed 's#\r\r{: #\r{: #g' \
    | tr '\r' '\n' \
    | tee "$fn" \
    > /dev/null
done
