" ---------- general config ----------

set relativenumber " sets line numbers relative to current line
set number " displays current line number

syntax on " enables syntax highlighting
set ignorecase " case insensitive search
set smartcase " uses case sensitive search with capital letters
set confirm " confirms saves for changed files
set hlsearch " highlights items found in lookup
set backspace=indent,eol,start " allow backspacing over autoindent, line breaks and start of insert action

set tabstop=4 " sets the width of the TAB character
set shiftwidth=4 " changes what happens when you use >>, <<, or == (automatic indentation)
" when opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" yaml indentation TODO(alice)
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ---------- aesthetics ----------

highlight clear LineNr
highlight clear VertSplit
highlight CursorLine ctermfg=103 " changes the cursor line color to a LOVELY slate grey
highlight Folded ctermfg=30 " changes folds to an EXQUISITE deep turquoise

" ---------- key bindings ----------

let mapleader ="\<Space>"

nnoremap <leader>vc :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>)
nnoremap - ddp
nnoremap _ dd2kp
nnoremap <leader>N 0i<cr><esc>
nnoremap <leader>nn $a<cr><esc>

" copy into OS clipboard
" TODO(alice): i don't really know how this works but it works. Something with
" registers? idk
vnoremap mm "*yy

" a pretty vim comment, inserting new lines above and below
nnoremap <leader>- i" ----------   ----------<esc>11hi

" ---------- buffer management ----------

set hidden " allow buffers to be hidden if you've modified a buffer

" move to the next and previous buffers
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>

" close the current buffer and move to the previous one
nnoremap <leader>q :bp <BAR> bd #<CR>

" use keys to navigate window splits
nnoremap <leader>d :wincmd l <CR>
nnoremap <leader>a :wincmd h <CR>
nnoremap <leader>w :wincmd k <CR>
nnoremap <leader>s :wincmd j <CR>

" ---------- tab management ----------
" As of now tabs are not very important in my workflow.

" ---------- >^.^< plugins >^.^< ----------

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter' " shows git changes
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " for programming in go
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " for looking for files
Plug 'junegunn/fzf.vim' " vim specific component
Plug 'neoclide/coc.nvim', {'branch': 'release'} " for auto-completion 
Plug 'pangloss/vim-javascript' " for JS syntax highlighting
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'html'] } " auto-formatting
Plug 'scrooloose/nerdtree' " file tree
Plug 'tpope/vim-commentary' " commenting
Plug 'tpope/vim-fugitive' " git blame 
Plug 'vim-airline/vim-airline' " buffer management
Plug 'vim-airline/vim-airline-themes' " buffer management themes
Plug 'yggdroot/indentLine' " for indentation guides

call plug#end()

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pc :PlugClean<cr>

" ---------- vim-gitgutter ----------

highlight clear SignColumn
highlight GitGutterAdd ctermfg=30
highlight GitGutterChange ctermfg=103
highlight GitGutterDelete ctermfg=163

" ---------- vim-go TODO(alice) ----------

nnoremap <leader>o :GoDef<CR>
nnoremap <leader>p :GoDefPop<CR>
nnoremap <leader>bb :GoCallers<CR>

nnoremap <leader>tt :GoTest<CR>
nnoremap <leader>tf :GoTestFunc<CR>

let g:go_imports_autosave = 1 
let g:go_diagnostics_level = 1

" TODO(alice)
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" ---------- fzf ----------

nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>

" ---------- coc.nvim TODO(alice) ----------

" ---------- vim-prettier ----------

" TODO(alice)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0 
let g:prettier#config#tab_width = 2 
let g:prettier#config#use_tabs = 'false'

" ---------- nerdtree ----------

map <C-n> :NERDTreeToggle<CR>

" ---------- vim-commentary ----------
" gcc to comment out a line
" gc in visual mode to comment out a block
" gc[target], e.g. gcap

" ---------- vim-fugitive ----------

nnoremap <leader>who :Gblame<cr>
nnoremap <leader>gdf :Git diff<cr>

" This diff border highlighting is ugly but not in a crippling way.
" Consider changing.
nnoremap <leader>ldf :Gvdiffsplit<cr>
nnoremap <leader>ga :Git add %<cr>
nnoremap <leader>grs :Git restore %<cr>

" ---------- vim-airline ----------

let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename
let g:airline#extensions#branch#enabled = 1 " show git branch

" ---------- vim-arline-theme ----------

let g:airline_theme='deus' " pretty colors

" ---------- indentLine ----------

" TODO(alice)
let g:indentLine_char = '⦙'

" ---------- FIN ----------
