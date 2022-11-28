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
if type "brew" > /dev/null 2>&1; then
  echo -e "✅ brew already exist"
else
  echo -e "🙅 Homebrew was not exist\nInstall Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  exit
fi

###########
# Ansible #
###########
echo -e "-----\nCheck Ansible"
if type "ansible" >/dev/null 2>&1; then
  echo -e "✅ Ansible already exist"
else
  echo -e "🙅 ansible was not installed"
  brew install ansible
fi

echo -e "-----\nAnsible Deploy"
cd ~
curl -O -sfSL https://raw.githubusercontent.com/tezooka/configs/master/ansible-arm64-mac.yml
if [ -f ~/ansible-arm64-mac.yml ]; then
  ansible-galaxy collection install community.general
  ansible-playbook ansible-arm64-mac.yml --ask-become-pass
  rm ~/ansible-arm64-mac.yml
else
  echo -e "🙅 ansible-playbook was not downloaded"
  exit
fi

####################
# Google Cloud SDK #
####################
echo -e "-----\nCheck Google Cloud SDK"
if [ -f ~/.zshrc ]; then
  if [ "`cat ~/.zshrc | grep -e "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'" -e "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'"`" ]; then
    echo -e '✅ Google Cloud SDK PATH already exist'
  else
    echo -e '🙅 Google Cloud SDK PATH was not exist\nUpdate .zshrc'
    echo "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'" >> ~/.zshrc
    echo "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'" >> ~/.zshrc
    source ~/.zshrc
  fi
else
  echo -e '🙅 Google Cloud SDK PATH was not exist\nUpdate .zshrc'
  echo "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'" >> ~/.zshrc
  echo "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'" >> ~/.zshrc
  source ~/.zshrc
fi
