#!/bin/zsh

# Define a function which rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

symlink() {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  fi
}

for name in vimrc vim zshrc zsh tmux.conf; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    backup $target
    symlink $PWD/$name $target
  fi
done

# link to vscode setting
for name in settings.json keybindings.json extensions.json; do
  target="$HOME/Library/Application Support/Code/User/$name"
  backup $target
  symlink $PWD/vscode/$name $target
done

# link to cursor setting
for name in settings.json keybindings.json extensions.json; do
  target="$HOME/Library/Application Support/Cursor/User/$name"
  backup $target
  symlink $PWD/vscode/$name $target  // same as vscode
done
