"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/cat/.vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/cat/.vim')
  call dein#begin('/home/cat/.vim')

  " Let dein manage dein
  " Required:
  call dein#add('/home/cat/.vim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
    call dein#add('Rip-Rip/clang_complete')
    call dein#add('rust-lang/rust.vim')
    call dein#add('racer-rust/vim-racer')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('bling/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')
    call dein#add('tommcdo/vim-exchange')
    call dein#add('chrisbra/Recover.vim')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('kana/vim-textobj-user')
    call dein#add('jceb/vim-textobj-uri')
    call dein#add('glts/vim-textobj-comment')
    call dein#add('vimwiki/vimwiki')
    call dein#add('sjl/gundo.vim')
    call dein#add('jebaum/vim-tmuxify')
    call dein#add('lervag/vimtex')
    call dein#add('chrisduerr/vim-undead')
    call dein#add('vim-scripts/taglist.vim')
    call dein#add('svermeulen/vim-extended-ft')
    call dein#add('w0rp/ale')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

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
nnoremap <leader>up :call dein#update()<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>W :w !sudo tee % > /dev/null<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>t :TlistToggle<cr>
nnoremap <leader>mt :TlistAddFilesRecursive .<cr>
nnoremap <leader>ut :TlistHighlightTag<cr>
nnoremap <leader>u :GundoToggle<cr>
nnoremap <leader>w :exec &list==1? "set nolist" : "set list"<cr>
nnoremap <leader>ss :exec &spell==1? "set nospell" : "set spell"<cr>
nnoremap <leader>sen :set spelllang=en<cr>
nnoremap <leader>snl :set spelllang=nl<cr>
nnoremap <leader>cc :call ToggleList("Quickfix List", 'c')<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>r :so $MYVIMRC<cr>

" C snips
autocmd FileType c inoremap ;for for (int i = 0; i < xxx; ++i) {<cr>}<esc>kfxcw
autocmd FileType c inoremap ;while while () {<cr>}<esc>kf(a
autocmd FileType c inoremap ;if if () {<cr>}<esc>kf(a
autocmd FileType c inoremap ;el else {<cr>}<esc>ko
autocmd FileType c inoremap ;pf printf("\n");<esc>2F"a
autocmd FileType c inoremap ;main int<cr>main(int arc, char *argv[])<cr>{<cr>return 0;<cr>}<esc>3kwvi(
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

" Backspacing
set bs=2

" Tidy undo/backup/swp files
set undodir=~/.vim/.undo// 
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set viminfo+=n~/.vim/.viminfo
set backup
set undofile

set history=9999
set ruler
set showcmd
set incsearch

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
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

" Highlighting/color
set t_Co=256
colorscheme undead
hi Normal ctermbg=NONE ctermfg=7
hi String ctermfg=15
hi Search ctermbg=7 ctermfg=0 cterm=bold term=none
hi IncSearch ctermbg=7 ctermfg=0 cterm=bold term=none
hi Visual ctermfg=0 ctermbg=7 cterm=NONE
hi VertSplit ctermfg=7 ctermbg=8 cterm=NONE
hi LineNr ctermfg=8 ctermbg=NONE cterm=NONE
hi CursorLineNr ctermfg=red ctermbg=NONE
hi NonText ctermbg=NONE
hi Constant ctermbg=NONE
hi WildMenu ctermbg=8 ctermfg=red cterm=bold
hi StatusLine ctermbg=8 ctermfg=7 cterm=none term=none
hi StatusLineNC ctermfg=15 ctermbg=0 cterm=none term=none
hi ModeMsg ctermbg=NONE
hi MoreMsg ctermbg=NONE
hi Pmenu ctermbg=NONE
hi PmenuSel ctermbg=NONE ctermfg=red cterm=bold
hi SpellBad ctermfg=0
hi SpellCap ctermfg=0
hi SpellLocal ctermfg=0
hi SpellRare ctermfg=0

" Indenting
set ai
set si
set cindent
set cino=t0
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Linenumbers
set rnu
set nu
" Complete
set complete=.,w,b,u,t,i,kspell

" Clang Complete Settings
let g:clang_use_library=1
" if there's an error, allow us to see it
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
let g:clang_close_preview=1
let g:clang_memory_percent=70
let g:clang_auto_select=1
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

" Airline Settings
let g:airline_theme = 'monochrome'

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


set completefunc=syntaxcomplete#Complete

" Racer Settings
set hidden

" Easy Allign Settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tmuxify Settings
let g:tmuxify_custom_command = 'tmux split-window -d -l 15'
let g:tmuxify_map_prefix = '<leader>m'
let g:tmuxify_run = {
    \ 'sh': 'bash %',
    \ 'go': 'go build %',
    \ 'c': 'make clean install',
    \}

" Vimtex Settings
let g:vimtex_view_method = 'zathura'

" ALE Settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
    \   'c': ['gcc', 'cppcheck'],
    \   'cpp': ['gcc', 'cppcheck'],
    \}

" Unfuck/reapply colors under ssh connection
if $SSH_CONNECTION
    autocmd Colorscheme * hi Normal ctermbg=NONE ctermfg=7
    autocmd Colorscheme * hi String ctermfg=15
    autocmd Colorscheme * hi Search ctermbg=15 ctermfg=0 cterm=bold term=none
    autocmd Colorscheme * hi IncSearch ctermbg=15 ctermfg=0 cterm=bold term=none
    autocmd Colorscheme * hi Visual ctermfg=0 ctermbg=7 cterm=NONE
    autocmd Colorscheme * hi VertSplit ctermfg=7 ctermbg=8 cterm=NONE
    autocmd Colorscheme * hi LineNr ctermfg=8 ctermbg=NONE cterm=NONE
    autocmd Colorscheme * hi CursorLineNr ctermfg=red ctermbg=NONE
    autocmd Colorscheme * hi NonText ctermbg=NONE
    autocmd Colorscheme * hi Constant ctermbg=NONE
    autocmd Colorscheme * hi WildMenu ctermbg=8 ctermfg=red cterm=bold
    autocmd Colorscheme * hi StatusLine ctermbg=8 ctermfg=7 cterm=none term=none
    autocmd Colorscheme * hi StatusLineNC ctermfg=15 ctermbg=0 cterm=none term=none
    autocmd Colorscheme * hi ModeMsg ctermbg=NONE
    autocmd Colorscheme * hi MoreMsg ctermbg=NONE
    autocmd Colorscheme * hi Pmenu ctermbg=NONE
    autocmd Colorscheme * hi PmenuSel ctermbg=NONE ctermfg=red cterm=bold
    autocmd Colorscheme * hi SpellBad ctermfg=0
    autocmd Colorscheme * hi SpellCap ctermfg=0
    autocmd Colorscheme * hi SpellLocal ctermfg=0
    autocmd Colorscheme * hi SpellRare ctermfg=0
endif
