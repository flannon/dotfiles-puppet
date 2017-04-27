set nocompatible " Required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" more Plugin commands
" ...
"call vundle#end()            " required
"filetype plugin indent on    " required

" plugin on Github
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'rodjek/vim-puppet'
Plugin 'plasticboy/vim-markdown'
Plugin 'davidhalter/jedi-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-vagrant'


" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

set background=dark
set hlsearch
set nu
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype on
filetype plugin indent on

syntax on

au BufReadPost *.twig colorscheme koehler 
au BufReadPost *.css colorscheme slate 
au BufReadPost *.cfg colorscheme monokai
au BufReadPost *.json colorscheme molokai
au BufReadPost *.js colorscheme elflord 
au BufReadPost *.erb colorscheme molokai
au BufReadPost *.sh colorscheme molokai
au BufReadPost *.html colorscheme monokai
au BufReadPost *.java colorscheme monokai
au BufReadPost *.php colorscheme two2tango
au BufReadPost *.py colorscheme molokai
au BufReadPost *.pp colorscheme molokai
au BufReadPost *rc colorscheme molokai
au BufReadPost Puppetfile colorscheme molokai
au BufReadPost *.tf colorscheme molokai
au BufReadPost Rakefile colorscheme molokai
au BufReadPost Vagrantfile colorscheme molokai
au BufReadPost vimrc colorscheme molokai
au BufReadPost *.vimrc colorscheme molokai
au BufReadPost *.yaml colorscheme molokai

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Tab stops work, but I'd like something better
" use 4 spaces for tabs
"set tabstop=4 softtabstop=4 shiftwidth=4

" display indentation guides
"set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
"autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
"autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
"autocmd! bufwritepost * set noexpandtab | retab! 4

"execute pathogen#infect()
call vundle#end()
filetype plugin indent on