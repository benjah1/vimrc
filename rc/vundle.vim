set nocompatible              " be iMproved
filetype off                  " required!

call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Language
Bundle 'mattn/emmet-vim'
Bundle 'othree/html5.vim'
Bundle 'briancollins/vim-jst'
Bundle 'cakebaker/scss-syntax.vim'
" Required by vim-markdown
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'

" Completion
" YouCompleteMe - need to build
Bundle 'valloric/youCompleteMe' 

" Code display
Bundle 'ap/vim-css-color' 
Bundle 'nathanaelkane/vim-indent-guides' 

" Integrations
" - git
Bundle 'tpope/vim-fugitive' 
Bundle 'airblade/vim-gitgutter' 
" - tag
Bundle 'szw/vim-tags' 
Bundle 'majutsushi/tagbar' 
" Tagbar-PhpCtags - need to install php and build
Bundle 'vim-php/tagbar-phpctags.vim' 
Bundle 'mileszs/ack.vim' 
" tern_for_vim - need to intall npm and setup tmp folder and build
Bundle 'marijnh/tern_for_vim' 

" Interface
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors' 
Bundle 'bling/vim-airline'
Bundle 'tomasr/molokai' 

" Command
Bundle 'terryma/vim-expand-region' 
Bundle 'Shougo/vimproc.vim'
Bundle 'tpope/vim-dispatch'

" Other
Bundle 'editorconfig/editorconfig-vim'
