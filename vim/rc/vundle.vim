call plug#begin('/var/lib/vim/plugged')

" Language
" Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
" Plug 'briancollins/vim-jst'
Plug 'elzr/vim-json'
Plug 'cakebaker/scss-syntax.vim'
Plug 'godlygeek/tabular' " Required by vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'ekalinin/dockerfile.vim'

" Completion
Plug 'valloric/youCompleteMe' " need to build

" Code display
Plug 'ap/vim-css-color' 
Plug 'nathanaelkane/vim-indent-guides' 

" Integrations
" - git
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter' 
" - tag
Plug 'szw/vim-tags' 
Plug 'majutsushi/tagbar' 
" Plug 'vim-php/tagbar-phpctags.vim' " need to install php and build
Plug 'mileszs/ack.vim' 
Plug 'ternjs/tern_for_vim' " tern_for_vim - need to intall npm and setup tmp folder and build

" Interface
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors' 
Plug 'itchyny/lightline.vim' " lighter
Plug 'tomasr/molokai' 

" Command
Plug 'terryma/vim-expand-region' 
Plug 'shougo/vimproc.vim'
Plug 'tpope/vim-dispatch'

" Other
Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'

call plug#end()
