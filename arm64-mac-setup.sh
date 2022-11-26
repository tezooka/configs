#!/bin/bash

#########
# Xcode #
#########
echo -e "-----\nCheck Xcode"
if type "xcode-select" > /dev/null 2>&1; then
  echo -e "✅ Xcode already exist"
else
  echo -e "🙅 Xcode was not exist\n>>> Please install Xcode from AppStore."
  open "https://apps.apple.com/jp/app/xcode/id497799835"
  exit
fi

############
# Homebrew #
############
echo -e "-----\nCheck Homebrew"
if [ -f ~/.zprofile ]; then
  if [ "`cat ~/.zprofile | grep 'eval "$(/opt/homebrew/bin/brew shellenv)"'`" ]; then
    echo '✅ Homebrew PATH already exist'
  else
    echo -e "🙅 Homebrew PATH was not exist\nUpdate .zprofile"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    source ~/.zprofile
  fi
else
  echo -e "🙅 Homebrew PATH was not exist\nUpdate .zprofile"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  source ~/.zprofile
fi
if type "brew" > /dev/null 2>$1; then
  echo -e "✅ brew already exist"
else
  echo -e "🙅 Homebrew was not exist\nInstall Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e ".zprofile"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  source ~/.zprofile
fi
