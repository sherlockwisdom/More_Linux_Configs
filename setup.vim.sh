#!/bin/bash



# decide which os
OS=""
if [ -f /etc/manjaro-release ] ; then
	OS="manjaro"
else
	OS="ubuntu"
fi

# Install Audio arch i3
if [ "$OS" == "manjaro" ] ; then
	# TODO: Show all the card options for user to choose which one to install
	sudo pacman -S asoundconf rofi
	asoundconf set-default-card PCH
fi

echo ">> Add the following line for rofi..."
echo "bindsym $super+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -font 'Noto Sans 8'"

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
if [ "$OS" == "ubuntu" ] ; then
	sudo apt install fonts-powerline
elif [ "$OS" == "manjaro" ] ; then
	sudo pacman -S powerline-fonts
fi
echo -e "\n"

# Configuring pathogen
echo "- Configuring pathogen..."
echo -e \
"execute pathogen#infect()
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set incsearch
set number
set updatetime=100
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:airline#extensions#tabline#buffer_nr_show = 1" >> ~/.vimrc
echo -e "\n"

echo "[+] Installing Bundle: Airline..."
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
echo -e "\n"

echo "[+] Installing Bundle: Indentline..."
git clone https://github.com/yggdroot/indentline
echo -e "\n"

echo "[+] Installing Bundle: GitGutter..."
git clone https://github.com/airblade/vim-gitgutter
echo -e "\n"
