#!/bin/bash


# install pathogen
echo ">> Installing pathogen...."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo ">> Configuring pathogen..."
echo -e "execute pathogen#infect()\nsyntax on\nfiltype plugin indent on\n" >> ~/.vimrc
