set packpath^=~/.vim
if exists('*minpac#init')
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	call minpac#add('airblade/vim-gitgutter')
	call minpac#add('bling/vim-airline')
	call minpac#add('chrisbra/Recover.vim')
	call minpac#add('Ckath/vim-cate')
	call minpac#add('Ckath/vimxclip')
	call minpac#add('ericcurtin/CurtineIncSw.vim')
	call minpac#add('rhysd/vim-clang-format')
	call minpac#add('mbbill/undotree')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-surround')
	call minpac#add('vim-syntastic/syntastic')
endif
filetype plugin on

" functions
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" leader binds
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>W :w !sudo tee % > /dev/null<cr>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>w :exec &list==1? "set nolist" : "set list"<cr>
nnoremap <leader>i :exec &expandtab==1? "set noexpandtab" : "set expandtab"<cr>
nnoremap <leader>ss :exec &spell==1? "set nospell" : "set spell"<cr>
nnoremap <leader>sen :set spelllang=en<cr>
nnoremap <leader>snl :set spelllang=nl<cr>
nnoremap <leader>cc :call ToggleList("Quickfix List", 'c')<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>r :so $MYVIMRC<cr>
nnoremap <leader>sw :call CurtineIncSw()<cr>
nnoremap <silent> <leader>en :lnext<cr>
nnoremap <silent> <leader>ep :lprevious<cr>
nnoremap <leader>ee :call ToggleList("Location List", 'l')<cr>
nnoremap <leader>p :call GetClip()<cr>"xp
nnoremap <leader>rt :!ctags -o /tmp/tags -R $(pwd)<cr><cr>
nnoremap <leader>mu :packadd minpac <bar> source $MYVIMRC <bar> call minpac#update('', {'do': 'call minpac#status()'})<cr>
nnoremap <leader>mc :packadd minpac <bar> source $MYVIMRC <bar> call minpac#clean()<cr>
nnoremap <leader>ms :packadd minpac <bar> source $MYVIMRC <bar> call minpac#status()<cr>
nnoremap <leader>/ :nohlsearch<cr>

" scuffed resize commands
nnoremap <C-W><C-l> :resize +10<cr>
nnoremap <C-W><C-h> :resize -10<cr>
nnoremap <C-W><C-k> :resize +10<cr>
nnoremap <C-W><C-j> :resize -10<cr>

" fix .h being detected as cpp instead of c
autocmd BufRead,BufNewFile *.h set filetype=c
autocmd TerminalOpen * set nobuflisted

" c snips
autocmd FileType c inoremap ;for for (int i = 0; i < xxx; ++i) {<cr>}<esc>kfxcw
autocmd FileType c inoremap ;while while () {<cr>}<esc>kf(a
autocmd FileType c inoremap ;if if () {<cr>}<esc>kf(a
autocmd FileType c inoremap ;el else {<cr>}<esc>ko
autocmd FileType c inoremap ;pf printf("\n");<esc>2F"a
autocmd FileType c inoremap ;main int<cr>main(int argc, char *argv[])<cr>{<cr>return 0;<cr>}<esc>3kwvi(
autocmd FileType c inoremap ;inc #include <stdio.h><esc>T<vt.
autocmd FileType c inoremap ;finf for (;;) {<cr>}<esc>O
autocmd FileType c inoremap ;def #define 

" latex snips
autocmd FileType tex inoremap ;doc \begin{document}<cr>\end{document}<esc>O
autocmd FileType tex inoremap ;bf {\bf}<esc>i<space>
autocmd FileType tex inoremap ;it {\it}<esc>i<space>
autocmd FileType tex inoremap ;bi {\bf{\it}}<esc>hi<space>
autocmd FileType tex inoremap ;input \input{}<esc>i
autocmd FileType tex inoremap ;ver \begin{verbatim}<cr>\end{verbatim}<esc>O
autocmd FileType tex inoremap ;s \section{}<esc>i
autocmd FileType tex inoremap ;ss \subsection{}<esc>i
autocmd FileType tex inoremap ;sss \subsubsection{}<esc>i
autocmd FileType tex inoremap ;ssss \subsubsubsection{}<esc>i
autocmd FileType tex inoremap ;item <cr>\item<space>
autocmd FileType tex inoremap ;lu \begin{itemize}<cr>\end{itemize}<esc>O\item<space>
autocmd FileType tex inoremap ;li \begin{enumerate}<cr>\end{enumerate}<esc>O\item<space>
autocmd FileType tex inoremap ;q ``''<esc>hi
autocmd FileType tex inoremap ;cite \cite{}<esc>i
autocmd FileType tex inoremap ;hr \hline
autocmd FileType tex inoremap ;table \begin{tabular}{ \| l \| c \| r \| }<cr>\hline<cr>\hline<cr>\end{tabular}<esc>kO
autocmd FileType tex inoremap ;ti <space>\\ \hline<cr>

" shell snips autocmd FileType sh inoremap ;sh #!/bin/sh
autocmd FileType sh inoremap ;bash #!/bin/bash
autocmd FileType sh inoremap ;if if [ "$1" = "" ]; then<cr>fi<esc>kf[vi[
autocmd FileType sh inoremap ;ifb if [[ "$1" = "" ]]; then<cr>fi<esc>kf[vi[

" file searching
set path+=**
set wildmenu
set wildignorecase
cnoremap <C-Y> <Space><BS>

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" backspacing
set bs=2

" tidy undo/backup/swp files
set undodir=~/.vim/.undo// 
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set viminfo+=n~/.vim/.viminfo
set backup
set undofile

" highlighting/color
syntax on
colorscheme undeadcate
let g:airline_theme = 'monocate'

" indenting
set ai
set si
set cindent
set cino=t0
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4

" line numbers
set rnu
set nu
set cursorline cursorlineopt=number

" tags
set tags+=/tmp/tags

" complete
set complete=.,w,b,u,t,i,kspell
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview

" other preferable behaviour
set history=9999
set ruler
set showcmd
set hidden

" things stolen from the default vimrc
inoremap <C-U> <C-G>u<C-U>
if has('mouse')
    set mouse=a
endif
augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
augroup END
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" finally, plugin specific stuff
" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '[R]'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

" easy allign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_checkers = ['gcc']

" gitgutter
let g:gitgutter_map_keys = 0
autocmd BufWritePost * GitGutter
autocmd VimEnter * autocmd! gitgutter CursorHold,CursorHoldI

" clang formatter
let g:clang_format#detect_style_file = 1
nnoremap <buffer><leader>f :ClangFormat<cr>
vnoremap <buffer><leader>f :ClangFormat<cr>
