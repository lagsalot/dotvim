call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-airline'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'skalnik/vim-vroom'
Plug 'edkolev/tmuxline.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/dbext.vim'
Plug 'aliva/vim-fish'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

set shell=/bin/sh

set nocompatible
set number
set updatetime=1              " used with CursorHold to check for modified files

" set completeopt=longest,menu        " Tab completion options (only complete to the longest unambiguous match, and show a menu)
" set wildmode=list:longest,list:full " Tab completion options (only complete to the longest unambiguous match, and show a menu)

" Move between windows with CTRL+ regular j,k,h,l motion keys
map <C-J> <C-W>j<bar>
map <C-K> <C-W>k<bar>
map <c-h> <c-w>h<bar>
map <c-l> <c-w>l<bar>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1

" Gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_show_privates = 1
let g:gist_post_private = 1

" GPG-vim
let g:GPGPreferArmor = 1

" AutoCmds
au BufNewFile,BufRead *.dump  set filetype=sql
au BufNewFile,BufRead *.sql   set filetype=sql
au BufNewFile,BufRead *.otl   set background=light
au CursorHold * checktime " Check for modified files after 4 seconds of idle cursor
au BufRead * checktime

autocmd Filetype gitcommit setlocal spell textwidth=72

" Leader
let mapleader = ","
let g:mapleader = ","

" Shortcuts
nmap <Leader>r  :source ~/.vimrc<CR>
nmap <Leader>rr :source %<CR>
nmap <leader>w  :w<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q  :q<cr>
nmap <leader>cp :let @" = expand("% :p")<CR>
map  <Leader>h  :set invhls <CR>
map  <Leader>cn :cnext<CR>
map  <Leader>ti  :!tig<CR>
map  <Leader>gw  :Gwrite<CR>
map  <Leader>gwc :Gwrite<CR>:Gcommit<CR>

" Clear Code Comments
map <leader>c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" Misc
map <leader>ntt :NERDTreeToggle<CR>
map <Leader>tb  :TagbarToggle<CR>
map <leader>gc  :Gcommit<CR>
map <leader>t   :Tabularize /

" ScreenShell
map  <Leader>tsh   :ScreenShellVertical<CR>

" Gist
nmap <Leader>gl    :Gist -l<CR>
nmap <Leader>gd    :Gist -d<CR>:q<CR>:Gist -l<CR>

" git-flow features
nmap <leader>fl    :call ScreenShellSend("fl")<CR>
nmap <leader>fs    :call ScreenShellSend("fs <C-R>=expand("<cWORD>")<CR>")<CR>
nmap <leader>ff    :call ScreenShellSend("ff <C-R>=expand("<cWORD>")<CR>")<CR>
nmap <leader>fco   :call ScreenShellSend("fco <C-R>=expand("<cWORD>")<CR>")<CR>

" git-flow release
nmap <leader>rs    :call ScreenShellSend("rs <C-R>=expand("<cWORD>")<CR>")<CR>
nmap <leader>rf    :call ScreenShellSend("rf <C-R>=expand("<cWORD>")<CR>")<CR>

" git-flow hotfix
nmap <leader>hfs   :call ScreenShellSend("hfs <C-R>=expand("<cWORD>")<CR>")<CR>
nmap <leader>hff   :call ScreenShellSend("hff <C-R>=expand("<cWORD>")<CR>")<CR>
