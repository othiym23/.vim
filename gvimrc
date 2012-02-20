set gfn=Consolas:h11
set lines=40 columns=140
set fuopt=maxvert,maxhorz
set guioptions-=T

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
