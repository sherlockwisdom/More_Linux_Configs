#!/bin/bash

# Install zsh
echo "[+] Install zsh...."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "\n"

# Install pathogen
echo "[+] Installing pathogen...."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo -e "\n"

# Install powerline fonts
echo "[+] Installing powerline fonts...."
sudo apt install fonts-powerline
echo -e "\n"

# Configuring pathogen
echo "- Configuring pathogen..."
echo -e \
"execute pathogen#infect()
syntax on
filetype plugin indent on
set incsearch
set number
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1" >> ~/.vimrc
echo -e "\n"

echo "[+] Installing Bundle: Airline..."
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
echo -e "\n"

echo "[+] Installing Bundle: Indentline..."
git clone https://github.com/yggdroot/indentline
