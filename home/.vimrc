execute pathogen#infect()
set nocompatible              " new school
filetype plugin indent on

set history=50                " keep 50 lines of command line history
set ruler                     " show the cursor position all the time
set showcmd                   " display incomplete commands
set nowrap                    " dont wrap text
set autoread                  " Set to auto read when a file is changed from the outside
set expandtab                 " !tabs
set so=10                     " Set 10 lines to the cursor - when moving vertically using j/k
set t_Co=256                  " Color scheme
set number                    " Line Numbers
set numberwidth=5             " Line Numbers
set ignorecase                " Ignore case when searching
set smartcase                 " Be smart about it
set hlsearch                  " Highlight search results
set incsearch                 " Makes search act like search in modern browsers
set showmatch                 " Show matching brackets when text indicator is over them
set foldenable                " folding
set foldmethod=syntax         " folding
set foldlevel=1               " folding
set updatetime=1              " used with CursorHold to check for modified files

set completeopt=longest,menu        " Tab completion options (only complete to the longest unambiguous match, and show a menu)
set wildmode=list:longest,list:full " Tab completion options (only complete to the longest unambiguous match, and show a menu)

syntax enable                 " Pretty code

" Use ack for searching if installed.  p.s. install it
if executable("ack") 
  set grepprg=ack\ -H\ --nogroup\ --nocolor 
endif 

" Move between windows with CTRL+ regular j,k,h,l motion keys
map <C-J> <C-W>j<bar>
map <C-K> <C-W>k<bar>
map <c-h> <c-w>h<bar>
map <c-l> <c-w>l<bar>

" ScreenShell
let g:ScreenImpl               = 'Tmux'
let g:ScreenShellTmuxInitArgs  = '-2'
let g:ScreenShellQuitOnVimExit = 1
" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
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
let mapleader   = ","
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

" Comment Out Code 
map <leader># :s/^/#/   <CR>:nohlsearch<CR>
map <leader>/ :s/^/\/\//<CR>:nohlsearch<CR>
map <leader>> :s/^/> /  <CR>:nohlsearch<CR>
map <leader>" :s/^/\"/  <CR>:nohlsearch<CR>
map <leader>% :s/^/%/   <CR>:nohlsearch<CR>
map <leader>! :s/^/!/   <CR>:nohlsearch<CR>
map <leader>; :s/^/;/   <CR>:nohlsearch<CR>
map <leader>- :s/^/--/  <CR>:nohlsearch<CR>

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
