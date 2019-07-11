" Plugins
call zen#init()
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/Recover.vim'
Plugin 'Ckath/vim-cate'
Plugin 'Ckath/vimxclip'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'jebaum/vim-tmuxify'
Plugin 'junegunn/vim-easy-align'
Plugin 'rhysd/vim-clang-format'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-syntastic/syntastic'

filetype plugin on

" Functions
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

" Leader Binds
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>W :w !sudo tee % > /dev/null<cr>
nnoremap <leader>t :TlistToggle<cr>
nnoremap <leader>af :TlistAddFilesRecursive .<cr>
nnoremap <leader>ut :TlistHighlightTag<cr>
nnoremap <leader>u :GundoToggle<cr>
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
nnoremap <leader>zu :ZenUpdate<cr>
nnoremap <leader>zi :ZenInstall<cr>
nnoremap <leader>/ :nohlsearch<cr>

" scuffed resize commands
nnoremap <C-W><C-l> :resize +10<cr>
nnoremap <C-W><C-h> :resize -10<cr>
nnoremap <C-W><C-k> :resize +10<cr>
nnoremap <C-W><C-j> :resize -10<cr>

" fix .h being detected as cpp instead of c
autocmd BufRead,BufNewFile *.h set filetype=c
autocmd TerminalOpen * set nobuflisted

" C snips
autocmd FileType c inoremap ;for for (int i = 0; i < xxx; ++i) {<cr>}<esc>kfxcw
autocmd FileType c inoremap ;while while () {<cr>}<esc>kf(a
autocmd FileType c inoremap ;if if () {<cr>}<esc>kf(a
autocmd FileType c inoremap ;el else {<cr>}<esc>ko
autocmd FileType c inoremap ;pf printf("\n");<esc>2F"a
autocmd FileType c inoremap ;main int<cr>main(int argc, char *argv[])<cr>{<cr>return 0;<cr>}<esc>3kwvi(
autocmd FileType c inoremap ;inc #include <stdio.h><esc>T<vt.
autocmd FileType c inoremap ;finf for (;;) {<cr>}<esc>O
autocmd FileType c inoremap ;def #define 

" LaTeX snips
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

" Shell snips
autocmd FileType sh inoremap ;sh #!/bin/sh
autocmd FileType sh inoremap ;bash #!/bin/bash
autocmd FileType sh inoremap ;if if [ "$1" = "" ]; then<cr>fi<esc>kf[vi[
autocmd FileType sh inoremap ;ifb if [[ "$1" = "" ]]; then<cr>fi<esc>kf[vi[

" File Searching
set path+=**
set wildmenu
set wildignorecase
cnoremap <C-Y> <Space><BS>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Backspacing
set bs=2

" Tidy undo/backup/swp files
set undodir=~/.vim/.undo// 
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set viminfo+=n~/.vim/.viminfo
set backup
set undofile

" Highlighting/color
syntax on
colorscheme undeadcate
let g:airline_theme = 'monocate'

" Indenting
set ai
set si
set cindent
set cino=t0
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4

" Linenumbers
set rnu
set nu

" Tags
set tags+=/tmp/tags

" Complete
set complete=.,w,b,u,t,i,kspell
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete

" Other preferable behaviour
set history=9999
set ruler
set showcmd
set hidden

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" Airline Settings
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

" Easy Allign Settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tmuxify Settings
let g:tmuxify_global_maps = 1
let g:tmuxify_custom_command = 'tmux split-window -d -l 15'
let g:tmuxify_map_prefix = '<leader>m'
let g:tmuxify_run = {
    \ 'sh': 'bash %',
    \ 'go': 'go build %',
    \ 'c': 'make run',
    \}

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_checkers = ['gcc', 'gcccheck']

" GitGutter Settings
let g:gitgutter_map_keys = 0

" Clang Formatter Settings
let g:clang_format#detect_style_file = 1
nnoremap <buffer><leader>f :ClangFormat<cr>
vnoremap <buffer><leader>f :ClangFormat<cr>
