""""""""""""""""""""""""""""""
" => Vim Airline
""""""""""""""""""""""""""""""
" let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|^\.vender\'


""""""""""""""""""""""""""""""
" => Vim-tags
""""""""""""""""""""""""""""""
let g:vim_tags_use_vim_dispatch = 1


""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""
nmap <c-t> :TagbarToggle<cr>
let g:tagbar_autofocus = 1


""""""""""""""""""""""""""""""
" => Indent Guides
""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

map <c-i> :IndentGuidesToggle<cr>

""""""""""""""""""""""""""""""
" => Vim-MarkDown
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""
" => Emmet-vim
""""""""""""""""""""""""""""""
let g:user_emmet_mode='n'

let g:user_emmet_install_global = 0
autocmd FileType html,php EmmetInstall


""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""
let g:tagbar_phpctags_bin = '/root/.vim/plugged/tagbar-phpctags.vim/bin/phpctags'

""""""""""""""""""""""""""""""
" => NerdTree
""""""""""""""""""""""""""""""
map <c-d> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

""""""""""""""""""""""""""""""
" => Startify
""""""""""""""""""""""""""""""
let g:startify_session_dir = '/tmp/startify/session'
let g:startify_list_order = ['session', 'bookmarks', 'files']
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0
