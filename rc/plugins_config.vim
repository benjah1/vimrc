
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