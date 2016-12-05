"dein Scripts-----------------------------
" Required:
set runtimepath+=/home/bstaletic/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/bstaletic/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neoinclude.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('easymotion/vim-easymotion')
call dein#add('idanarye/vim-vebugger')
call dein#add('jiangmiao/auto-pairs')
call dein#add('kshenoy/vim-signature')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('mbbill/undotree')
call dein#add('neomake/neomake')
call dein#add('skywind3000/asyncrun.vim')
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('vim-scripts/a.vim')
call dein#add('weynhamz/vim-plugin-minibufexpl')
call dein#add('zchee/deoplete-clang')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#flags = ['-xc', '-DSTM32F4', '-DSTM32F407VG', '-DSTM32F4CCM', '-Wall', '-Wextra', '-Wno-main', '-Wno-main-return-type', '-I.', '-Ilibopencm3/include']

let neomake_c_gcc_maker = {
	\ 'args': ['-xc', '-DSTM32F4', '-DSTM32F407VG', '-DSTM32F4CCM', '-Wall', '-Wextra', '-Wno-main', '-Wno-main-return-type', '-I.', '-Ilibopencm3/include']
	\ }
let neomake_c_clang_maker = {
	\ 'args': ['-xc', '-DSTM32F4', '-DSTM32F407VG', '-DSTM32F4CCM', '-Wall', '-Wextra', '-Wno-main', '-Wno-main-return-type', '-I.', '-Ilibopencm3/include']
	\ }

let fts = ['c', 'cpp']
if index(fts, &filetype) == -1
	let &efm = '%-G%f:%s:,'
	let &efm .= '%f:%l:%c: %trror: %m,'
	let &efm .= '%f:%l:%c: %tarning: %m,'
	let &efm .= '%I%f:%l:%c: note: %m,'
	let &efm .= '%f:%l:%c: %m,'
	let &efm .= '%f:%l: %trror: %m,'
	let &efm .= '%f:%l: %tarning: %m,'
	let &efm .= '%I%f:%l: note: %m,'
	let &efm .= '%f:%l: %m'
endif
augroup ccpp
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c syntax=c.doxygen
augroup END
" The default is nice, so use that
let g:neomake_error_sign = {'text': 'E>', 'texthl': 'NeomakeErrorSign'}

" The default is not playing nice on my colorscheme so set a new one
" Make foreground yellow and background black
highlight MyWarningMsg ctermfg=yellow ctermbg=black
let g:neomake_warning_sign = { 'text': 'W>', 'texthl': 'MyWarningMsg', }

" Message I have yet to see!
let g:neomake_message_sign = { 'text': 'M>', 'texthl': 'NeomakeMessageSign', }

" Make foreground cyan and background black
highlight MyInfoMsg ctermfg=cyan ctermbg=black
let g:neomake_info_sign = {'text': 'I>', 'texthl': 'MyInfoMsg'}

nnoremap <silent> <BS> :TmuxNavigateLeft<CR>
" a.vim bindings
nnoremap <silent> <F4> :AV<CR>
nnoremap <silent> <F5> :AT<CR>
" auto-pairs
let g:AutoPairsFlyMode=1
let g:AutoPairsShortcutBackInsert='<C-b>'
" easymotion trigger
let g:EasyMotion_leader_key='<Leader>'
" Open MBE on the top
let g:miniBufExplBRSplit=0
" Toggle its buffer on <F9>
nnoremap <silent> <F8> :MBEToggle<CR>
nnoremap <silent> <F9> :MBEOpen<CR>:MBEFocus<CR>
augroup timeout
	autocmd!
	autocmd insertenter * set timeoutlen=100
	autocmd insertleave * set timeoutlen=500
augroup END
nnoremap Y y$
nnoremap <F2> :set invrelativenumber invnumber<CR>

" Easier <Leader> binding
let mapleader=' '

" Easier clipboard access
vnoremap <Leader>y "*y
vnoremap <Leader>d "*d
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>p "*p
vnoremap <Leader>P "*P

" Allow saving of files aas sudo when I forget to start vim using sudo
"cnoremap w!! w !sudo tee > /dev/null %

" make . work with visually selected lines
vnoremap . :norm.<CR>

" Only highlight the word under cursor, don't go to the next occurance
nnoremap * *:call HLNext(0.3)<CR>
nnoremap # #:call HLNext(0.3)<CR>

" Disable arrow keys when in normal mode
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

" Paste mapping
set pastetoggle=<F3>

" Make space open and close folds
nnoremap <Leader><space> za

" Map escape to any combination for easier access in insert mode
inoremap jk <esc>
syntax on " Enable syntax highlighting
"colorscheme boris " Set colorscheme
set history=5000 " Number of history commands remembered
filetype plugin indent on " Detect filetype and load appropriate file
set hlsearch " Highlight words matching search patterns
set ignorecase " Make searches case insensitive
set smartcase " Unless upper case is typed don't honor case
set ruler " Show position in a file on the status line
set incsearch " Move as search pattern is typed
set exrc " Allow loading of user defined extra config
set secure " Disable :au, shell and :w from exrc
set hidden " Hide buffers instead of requiring the user to save and quit
set matchpairs+=<:> " Make % match angle brackets

" Status
set laststatus=2 "Make the buffer always have a status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Wildmode - first complete as much as you can, then show a list
set wildmenu
set wildchar=<Tab>
set wildmode=longest,full

" Warn about lines longer than 80
highlight ColorColumn ctermbg=red "Set the colour of highlight
call matchadd('ColorColumn', '\%81v', 100) "set column nr

" Split windows
set splitright
set splitbelow

" Folding method
set foldmethod=syntax
set foldlevel=1

" Enable line numbers by default
set number

" Set tabline
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? ''. fnamemodify(bufname, ':t') . ' ' : &buftype == 'quickfix' ? '[Qickfix] ' : '[No name] ' )
    let s .= '[' . winnr . ']'

    if bufmodified
      let s .= '[+]'
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

" Undo files and dirs
set undofile
set undodir=~/.config/nvim/.undo
" Swap dir
set dir=~/.config/nvim/.swap
" Netrw
" Show files in wide mode
let g:netrw_liststyle=3
" Disable the annoying banner at the top
let g:netrw_banner=0
" Open the file in a buffer where the cursor was before calling netrw
let g:netrw_browse_split=4
" Open netrw in a vertical split on the right side
let g:netrw_altv=1
" Take up 25%
let g:netrw_winsize=25

" Open netrw in vertical split
nnoremap <silent> <F7> :Lex<CR>
" Python indentation workaround
augroup puton
	autocmd!
	autocmd FileType python setl ts=4 expandtab
augroup END
" Neosnippets
imap <C-j>     <Plug>(neosnippet_expand_or_jump)

source ~/.config/nvim/dcvimrc
