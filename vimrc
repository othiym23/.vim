" ogd@aoaioxxysz.net / othiym23 / Forrest L Norvell's vimrc 2012/02/19
"
" Use Vim settings, rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" Start by having Pathogen load any external bundles
if !exists("g:loaded_pathogen")
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent
set smartindent
set hidden              " allow movement between dirty buffers
set autowrite           " simplify dealing with buffers by auto-saving
set nobackup            " do not keep a backup file -- let VCS take care of that
set history=1000        " populate viminfo with command history
set ruler               " show the cursor position all the time
set number              " I like line numbers on by default
set showcmd             " display incomplete commands

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("autocmd")
  " a necessary hack to get ftdetect plugins in bundles working
  filetype off
  filetype on
  " a lot of the indentation controls have been moved to after/ftplugin/*.vim
  filetype plugin indent on

  " When editing a file, always jump to the last known cursor position. Don't
  " do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Mess with .vimrc
map <Leader>v :tabedit ~/.vim/vimrc<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Search
set incsearch           " do incremental searching
set ignorecase          " ignore case in searches by default
set smartcase           " case sensitive if you include upper case
set infercase           " fix completion to work the same as search + smartcase
set hlsearch            " highlight last-used search pattern

" UI
set mouse=a             " On!
set laststatus=2        " always display status line
set wildmode=full       " explicitly set wildmode
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
nmap <Leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" window shortcuts
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h

" my poor pinkies need a break
inoremap jj <Esc>

" hey, paste mode!
set pastetoggle=<F2>
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
map K k<S-j>$
" Don't use Ex mode, use Q for formatting
map Q gq
map Y y$
map <F1> :echo "F1 is for racing"<CR>

autocmd VimEnter COMMIT_EDITMSG :call cursor(1,1)
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace

" https://gist.github.com/2054996
"
" Human-readable long epoch dates (long meaning those that include milliseconds)
function! DateFromLongEpoch()
  " Let the shell divide because vim only supports 32 bit ints
  let sdate=system("echo $((". expand("<cword>") ."/1000))")
  " Format the date
  let human=tolower(substitute(strftime("%m/%d/%y %I:%M:%S%p", sdate), "\\\<0", "", "g"))

  return human ." (". (sdate - localtime()) ." seconds from now)"
endfunc

map <Leader>j :echo DateFromLongEpoch()<CR>

"
" PLUGIN CONFIGURATION
"


" Solarized is set up as a plugin
set background=dark
colorscheme solarized

" Powerline has almost too much configuration
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

" UltiSnips options
let g:UltiSnipsSnippetsDir = "~/.vim/resources/snippets"
" override plugin's included snippets, and include my own
let g:UltiSnipsSnippetDirectories = ["bundle/snippets/UltiSnips", "resources/snippets"]

" Tasklist options
map <Leader>T <Plug>TaskList

" vimwiki options
let default_wiki = {}
let default_wiki.path = '~/Dropbox/vimwiki'
let default_wiki.path_html = '~/Dropbox/vimwiki/html'
let g:vimwiki_list = [default_wiki]

" Haskell options
let g:haddock_browser = "open"

" Go options
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Command-T options
let g:CommandTMaxFiles = 30000
let g:CommandTMaxHeight = 10
map <Leader>F :CommandTFlush<CR>

" Gundo options
nnoremap <F5> :GundoToggle<CR>

" Tagbar options
nnoremap <F8> :TagbarToggle<CR>
" jsctags isn't ready, and ctags needs help
let g:tagbar_type_javascript = {
  \ 'ctagstype' : 'javascript',
  \ 'replace'   : 1,
  \ 'kinds'     : [
    \ 'e:exports',
    \ 'v:global variables',
    \ 'C:constants',
    \ 'c:classes',
    \ 'm:methods',
    \ 'f:functions',
    \ 'p:properties'
  \ ]
\ }

if executable('lushtags')
  let g:tagbar_type_haskell = {
    \ 'ctagsbin' : 'lushtags',
    \ 'ctagsargs' : '--ignore-parse-error --',
    \ 'kinds' : [
      \ 'm:module:0',
      \ 'e:exports:1',
      \ 'i:imports:1',
      \ 't:declarations:0',
      \ 'd:declarations:1',
      \ 'n:declarations:1',
      \ 'f:functions:0',
      \ 'c:constructors:0'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
      \ 'd' : 'data',
      \ 'n' : 'newtype',
      \ 'c' : 'constructor',
      \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
      \ 'data' : 'd',
      \ 'newtype' : 'n',
      \ 'constructor' : 'c',
      \ 'type' : 't'
    \ }
  \ }
endif

" Syntastic options
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint', 'standard']
let g:syntastic_mode_map = { "mode": "active",
                           \ 'active_filetypes': ['go', 'haskell', 'ocaml',
                           \    'ruby', 'python', 'yaml',
                           \    'javascript', 'json', 'less',
                           \    'puppet'],
                           \ 'passive_filetypes': [] }

" Ack options
map <Leader>a :Ack<space>
map <Leader>A "zyw:exe ":Ack ".@z<CR>
map <Leader>c :ccl<CR>:lcl<CR> " clean up Quicklist and Location windows

" search shortcuts
" (for some reason these have to go after Ack configuration)
"
" from Practical Vim: make \h do a souped-up screen refresh.
" Don't replace ctrl-l, because I'm using that for window navigation.
nnoremap <silent> <Leader>h :<C-u>nohlsearch<CR><C-l>
" also from Practical Vim: & will repeat the previous search with the same
" options, and will aslo work in visual mode
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Tabularize options
map <Leader>= :Tabularize /=<CR>
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
