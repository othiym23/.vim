" ogd@aoaioxxysz.net / othiym23 / Forrest L Norvell's vimrc 2012/01/23
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Add Pathogen support
call pathogen#infect()

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

set expandtab

" GUI customizations (anything that modifies fonts or windows directly should
" go in ~/.gvimrc).
set background=dark
colorscheme solarized

map <Leader>T <Plug>TaskList

set laststatus=2

" Mess with .vimrc
map <Leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" UI
set wildmenu
set mouse=a " On!

" Command-T options
let g:CommandTMaxFiles = 30000
let g:CommandTMaxHeight= 10

" Syntastic Options
let g:syntastic_auto_loc_list=1

" Shortcuts
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h

map <Leader>a :Ack
map <Leader>A "zyw:exe ":Ack ".@z<CR>
map <Leader>c :ccl<CR>:lcl<CR>
map <Leader>h :nohlsearch<CR>

map <Leader>p :set invpaste paste?<CR>
map <Leader>q /^\s*q\W<CR>

map <Leader>y :echo system('echo -n '.shellescape(@").' \| npaste')<CR>

map <Leader>F :CommandTFlush<CR>

map <Leader>= :Tabularize /= <CR>
map <Leader>> :Tabularize /=><CR>
map <Leader>, :Tabularize /,\zs<CR>

nnoremap <Space> :<C-U>call InsertChar#insert(v:count1)<CR>

" Anti-shortcuts
map <S-k> k<S-j>$
map <S-y> y$
map <F1> :echo "F1 is for racing"<CR>

autocmd VimEnter COMMIT_EDITMSG :call cursor(1,1)
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace

