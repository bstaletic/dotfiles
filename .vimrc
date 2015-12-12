" Misc

syntax on
colorscheme peachpuff
nmap <F1> :set invnumber<CR>
nmap <F2> :set invrelativenumber<CR>
set pastetoggle=<F3>
set history=50
set nocp
filetype plugin indent on
set hlsearch
set ignorecase
set smartcase
set ruler
set suffixes=.bak,~,.swp,.o,.info,.obj

" Status

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Split windows

set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easymotion trigger
let g:EasyMotion_leader_key='<Leader>'
" Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
"let g:clang_complete_copen = 1
