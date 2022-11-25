#!/bin/bash

#########
# Xcode #
#########
echo -e "-----\nCheck Xcode"
if type "xcode-select" > /dev/null 2>&1; then
  echo -e "✅ Xcode already exist"
  open "https://apps.apple.com/jp/app/xcode/id497799835"
else
  echo -e "🙅 Xcode was not exist\n>>> Please install Xcode from AppStore."
  open "https://apps.apple.com/jp/app/xcode/id497799835"
  exit
fi
