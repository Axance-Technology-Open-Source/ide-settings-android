#!/bin/bash
# Installs Square's and Axance tech configs into your user configs.

echo "Installing Axance Tech configs..."

CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"

for i in $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    # Install codestyles
    mkdir -p $i/codestyles
    cp -frv "$CONFIGS/codestyles"/* $i/codestyles

    # Install keymaps
    mkdir -p $i/keymaps
    cp -frv "$CONFIGS/keymaps"/* $i/keymaps

    # Install inspections
    mkdir -p $i/inspection
    cp -frv "$CONFIGS/inspection"/* $i/inspection

    # Install options ("Exclude from Import and Completion")
    mkdir -p $i/options
    cp -frv "$CONFIGS/options"/* $i/options
  fi
done

echo "Congratulation!"
echo ""
echo "Restart AndroidStudio, go to preferences, and apply 'DDFSquareAndroid'."
