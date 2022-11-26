#!/bin/bash

echo -e '----\nOS'
if [ "$(uname)" == "Darwin" ] && [ "$(uname -m)" == "x86_64" ]; then
  echo "- x86_64 Mac"
elif [ "$(uname)" == "Darwin" ] && [ "$(uname -m)" == "arm64"]; then
  echo "- arm64 Mac"
  zsh -c "$(curl -H 'Cache-Control: no-cache' -sfSL https://raw.githubusercontent.com/tezooka/configs/master/arm64-mac-setup.sh)"
else
  echo "Your platform ($(uname -a)) is not supported."
fi
