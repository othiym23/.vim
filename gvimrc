set lines=40 columns=140
set guioptions-=T
if has("gui_macvim")
  set fuopt=maxvert,maxhorz
  set guifont=Consolas\ for\ Powerline:h11
elseif has("gui_gtk2")
  set guifont=Ubuntu\ Mono\ 12
end

" use some TextMate-style indentation mappings
" http://vimcasts.org/episodes/indentation-commands/
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" make Vim tabs useful (i.e. more like Firefox or Chrome)
" http://vimcasts.org/episodes/working-with-tabs/
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" single-key motions while in soft wrap mode
" http://vimcasts.org/episodes/soft-wrapping-text/
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
