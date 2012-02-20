" ogd@aoaioxxysz.net / othiym23 / Forrest L Norvell's vimrc 2012/02/19
"
" Use Vim settings, rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent
set smartindent
set hidden              " allow movement between dirty buffers
set autowrite           " simplify dealing with buffers by auto-saving
set nobackup            " do not keep a backup file -- let VCS take care of that
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set number              " I like line numbers on by default
set showcmd             " display incomplete commands

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("autocmd")
  " a lot of the indentation controls have been moved to after/ftplugin/*.vim
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78 formatprg=par

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Mess with .vimrc
map <Leader>v :sp ~/.vim/vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Search
set incsearch           " do incremental searching
set ignorecase          " ignore case in searches by default
set smartcase           " case sensitive if you include upper case
set hlsearch            " highlight last-used search pattern

" UI
set mouse=a             " On!
set laststatus=2        " always display status line
set wildmenu            " use enhanced command completion

" highlighting settings grabbed from Kristján
highlight MatchParen   cterm=bold      ctermfg=1     ctermbg=0
highlight OverLength   cterm=none      ctermfg=1     ctermbg=0
highlight Pmenu                                      ctermbg=8
highlight PmenuSel     cterm=bold      ctermfg=10    ctermbg=4
highlight PmenuThumb                   ctermfg=6
highlight Search       cterm=none      ctermfg=0     ctermbg=3
highlight StatusLine   cterm=bold      ctermfg=7     ctermbg=8
highlight StatusLineNC cterm=none      ctermfg=0     ctermbg=8
highlight ToDo         cterm=underline ctermfg=3     ctermbg=none

autocmd WinEnter,BufRead * match OverLength /\%81v.\+/

" Shortcut to rapidly toggle between showing and hiding invisible
" character display.
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" window shortcuts
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h

" my poor pinkies need a break
imap jj <Esc>

map <Leader>p :set invpaste paste?<CR> " invert paste mode
map <Leader>q /^\s*q\W<CR>

" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <Leader>ew :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>et :tabe %%

" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist
set showbreak=…

" Anti-shortcuts
map <S-k> k<S-j>$
map <S-y> y$

autocmd VimEnter COMMIT_EDITMSG :call cursor(1,1)
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace


"
" PLUGIN CONFIGURATION
"


" Start by having Pathogen load the plugins.
call pathogen#infect()

" Solarized is set up as a plugin
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Tasklist options
map <Leader>T <Plug>TaskList

" Haskell options
let g:haddock_browser = "open"

" Command-T options
let g:CommandTMaxFiles = 30000
let g:CommandTMaxHeight= 10
map <Leader>F :CommandTFlush<CR>

" Gundo options
nnoremap <F5> :GundoToggle<CR>

" Syntastic options
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { "mode": "active",
                           \ 'active_filetypes': ['go', 'haskell', 'ocaml',
                           \    'ruby', 'python', 'yaml',
                           \    'javascript', 'json', 'less',
                           \    'puppet'],
                           \ 'passive_filetypes': [] }

" Ack options
map <Leader>a :Ack
map <Leader>A "zyw:exe ":Ack ".@z<CR>
map <Leader>c :ccl<CR>:lcl<CR> " clean up Quicklist and Location windows
map <Leader>h :nohlsearch<CR>

" Tabularize options
map <Leader>= :Tabularize /= <CR>
map <Leader>> :Tabularize /=><CR>
map <Leader>, :Tabularize /,\zs<CR>

" NERDtree options
"
" convenient to have a hotkey for the NERDtree
nnoremap <F4> :NERDTreeToggle<CR>
" open up a NERDtree at startup if there are no files provided (which is
" almost always, given that mvim causes hangs on Lion.
autocmd vimenter * if !argc() | NERDTree | endif
" autoquit if NERDtree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
