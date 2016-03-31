" Plug
call plug#begin()

" Plugins I like, all hosted on github
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-scripts/SearchComplete'
"Plug 'scrooloose/syntastic'
"Plug 'Rip-Rip/clang_complete'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'spf13/vim-autoclose'
Plug 'clvv/a.vim', {'for': ['cpp', 'c']}
"Plug 'ervandew/supertab'

call plug#end()

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

" Autoclose - do not auto close double quote marks in vim type buffers (exampl: .vimrc)
let g:autoclose_vim_commentmode=1

" Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" a.vim bindings
nmap <F4> :AV<CR>
nmap <F5> :AT<CR>

" easymotion trigger
let g:EasyMotion_leader_key='<Leader>'

" NERDTree
nmap <F6> :NERDTreeToggle<CR>

" Python indentation
au FileType python setl ts=4 expandtab
