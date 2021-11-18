# Console development enviroment

Here are some to do's to set up my development enviroment.

Run `git clone https://github.com/MauDev98/MauDotFiles.git` in any folder, preferred in the Downloads folder.

Inside .config folder there are neovim's and kitty's terminal conf files to be copied in the locations specified in the following instructions.

## Install the following somehow

* Neovim version > 5.0
* Tmux
* Zsh 
* Git
* Curl
* One or more nerdfont fonts, preferred => sauce code pro, anonymice

## Change terminal SHELL to zsh, install oh-my-zsh and it's plugins

1. Run the following command on terminal:
```
chsh -s $(which zsh)
```
2. Log out and then log back in.
3. On first run choose the default configuration
4. Install oh-my-zsh with the following:
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
5. Install powerlvl10k theme:
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
6. Edit the .zshrc file inside home folder, with this line: ZSH_THEME="powerlevel10k/powerlevel10k"
7. Restart the terminal and run through the configuration with your preferences.
8. Install auto-suggestions and syntax-highlighting:
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
9. Add the following line to your .zshrc file: plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

EXTRA: set these aliases  edition the .zshrc file for faster launch of neovim and terminal-multiplexor:
```
alias nv="nvim"
alias tm="tmux"
```

## Kitty terminal configuration and themes

1. Install kitty terminal
2. Copy kitty.conf inside $HOME/.config/kitty
3. Run the following git command:
```
git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
```
4. Change include theme to choose another theme if wanted (default is the ayu theme).

## Neovim full operational requesites

1. Copy nvim/ folder to $HOME/.config/
2. Install Python 3.something.
3. Install the following pip packages globally for python support:
```
pip install pynvim
pip install neovim
```
4. Vim-plug plugin manager for linux:
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
5. Run :PlugInstall on neovim. 
6. Install node-js
7. Run the following npm commands to install the language servers for css, html, js and python:
```
npm i -g vscode-langservers-extracted
npm install -g typescript typescript-language-server
npm i -g pyright
npm i -g live-server
```
## TMUX set up 

1. Copy the .tmux.conf file in the $HOME folder
2. Install Tmux plugin manager:
```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
3. Prefix is `<C-space>`, press prefix + I (capital i) to install puglins
4. Read shortcuts in the .tmux.conf file 
