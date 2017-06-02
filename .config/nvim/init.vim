call plug#begin('~/.vimbundle/')

" Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benekastah/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'yssl/QFEnter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rking/ag.vim'
Plug 'janko-m/vim-test'
Plug 'szw/vim-tags'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'

" Language specific plugins
Plug 'tpope/vim-rails',         { 'for' : 'ruby' }
Plug 'fatih/vim-go',            { 'for' : 'go'   }
Plug 'slim-template/vim-slim',  { 'for' : 'slim' }
Plug 'pangloss/vim-javascript', { 'for' : 'javascript.jsx' }
Plug 'mxw/vim-jsx',             { 'for' : 'javascript.jsx' }
Plug 'hail2u/vim-css3-syntax',  { 'for' : 'scss.css' }

" Command specific plugins
Plug 'scrooloose/nerdtree',      { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }

" End plug
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <LocalLeader>m :call NerdTreeToggle()<CR>
let g:NERDTreeWinSize = 30

" Smart Toggle
function! NerdTreeToggle()
  if exists("t:NERDTreeBufName")
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfunction

let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapOpenSplit='<C-s>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <LocalLeader>g :TagsGenerate!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nma <C-p> :FZF -m<CR>
nmap <LocalLeader>a :FzfAg<Space>
nmap <LocalLeader>t :Ag!<Space>
nmap <LocalLeader>aq :Ag! -Q<Space>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor    " Use ag over grep
endif

""""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 3
imap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "<Tab>"
imap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ag_working_path_mode="r"

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Kill any trailing whitespace on save (credit to FB)
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

let g:kill_whitespace_blacklist = ["snippets"]
if index(g:kill_whitespace_blacklist, &ft) < 0
  au BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

" show tabs as >

set list

" Neovim workaround for C-h
if has('nvim')
  nnoremap <BS> <C-W>h
endif

" Copy file path
nnoremap <LocalLeader>u :let @+=expand('%')<CR>

" Clipboard
set clipboard=unnamed
set fileformats=unix
set ff=unix

" colors zenburn
syntax enable
set background=dark
" set background=light
colorscheme solarized

filetype plugin indent on
set number
set hlsearch
set shiftwidth=1
set tabstop=2
set expandtab
set ignorecase
let g:CommandTMaxFiles=2000000
let g:CommandTFileScanner="find"
let g:CommandTTraverseSCM="file"
let g:CommandTMaxCachedDirectories = 10

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
noremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>nv :vsplit `echo $HOME/notes.txt`<cr>
inoremap jk <esc>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
cnoremap <C-v> <C-R><S-">
cnoremap <C-P> <C-R>%
noremap <C-g> :NERDTreeFind<CR>
