" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" These are required for Vundle, filetype will later be set to on
set nocompatible
filetype off
Plugin 'VundleVim/Vundle.vim'

" Plugins I like, all hosted on github
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'Rip-Rip/clang_complete'
Plugin 'kshenoy/vim-signature'
Plugin 'easymotion/vim-easymotion'
Plugin 'spf13/vim-autoclose'
Plugin 'clvv/a.vim'
Plugin 'ervandew/supertab'

call vundle#end()

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

"Supertab

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrexedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = [ "&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

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

" Autoclose - do not auto close double quote marks in vim type buffers (exampl: .vimrc)
let g:autoclose_vim_commentmode=1

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" a.vim bindings
nmap <F4> :AV
nmap <F5> :AT

" easymotion trigger
let g:EasyMotion_leader_key='<Leader>'
" Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
"let g:clang_complete_copen = 1
