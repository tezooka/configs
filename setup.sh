#!/bin/bash

echo -e '----\nOS'
if [ "$(uname)" == "Darwin" ] && [ "$(uname -m)" == "x86_64" ]; then
  echo "- x86_64 Mac"
elif [ "$(uname)" == "Darwinn" ] && [ "$(uname -m)" == "arm64"]; then
  echo "- arm64 Mac"
else
  echo "Your platform ($(uname -a)) is not supported."
fi
