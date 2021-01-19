#!/bin/bash


# install pathogen
echo "[+] Installing pathogen...."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "[+] Installing powerline fonts...."
sudo apt install fonts-powerline

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

echo "[+] Installing Bundle: Airline..."
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
