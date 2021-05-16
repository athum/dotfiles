set relativenumber " sets line numbers relative to current line
set number " displays current line number
set cursorline " highlights the cursor line
highlight CursorLine ctermfg=103 " changes the cursor line color to a lovely slate grey

" sets the width of the TAB character
set tabstop=4
" changes what happens when you use >>, <<, or == (automatic indentation)
set shiftwidth=4

" when opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

syntax on " enables syntax highlighting
set ignorecase " case insensitive search
set smartcase " uses case sensitive search with capital letters
set confirm " confirms saves for changed files
set hlsearch " highlights items found in lookup
set backspace=indent,eol,start " allow backspacing over autoindent, line breaks and start of insert action

" copy and paste from OS clipboard - TODO(alice): issues with this mapping 
vnoremap <Leader>mm "*yy

" solarized colorscheme (not necessary when using hyper)
" colorscheme solarized8
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" set background=dark

" border aesthetics
highlight clear LineNr
highlight clear VertSplit
highlight clear CusorLine

" leader key
let mapleader ="\<Space>"

" define plugins to install
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter' " shows git changes
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " for programming in go
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " for looking for files
Plug 'junegunn/fzf.vim' " vim specific component
Plug 'neoclide/coc.nvim', {'branch': 'release'} " for auto-completion 
Plug 'pangloss/vim-javascript' " for JS syntax highlighting
Plug 'pedrohdz/vim-yaml-folds' " for yaml folding
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'html'] } " is this a formatter? what is this?
Plug 'scrooloose/nerdtree' " file tree
Plug 'tpope/vim-commentary' " commenting
Plug 'tpope/vim-fugitive' " git blame 
Plug 'vim-airline/vim-airline' " buffer management
Plug 'vim-airline/vim-airline-themes' " buffer management themes
Plug 'yggdroot/indentLine' " for indentation guides

call plug#end()

" -----------coding---------------

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" gitgutter aesthetics
highlight clear SignColumn
highlight clear GitGutterAdd
highlight clear GitGutterChange
highlight clear GitGutterDelete

" yaml indentation and folding
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
set foldlevelstart=20

" -----------buffer and status bar management---------------

set hidden " allow buffers to be hidden if you've modified a buffer

" move to the next and previous buffers
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>

" use keys to navigate window splits
nnoremap <leader>d :wincmd l <CR>
nnoremap <leader>a :wincmd h <CR>
nnoremap <leader>w :wincmd k <CR>
nnoremap <leader>s :wincmd j <CR>

" airline
let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename
let g:airline#extensions#branch#enabled = 1 " show git branch
let g:airline_theme='deus' " pretty colors

" -----------autoformatting---------------

" Enable prettier auto formatting of files. 
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0 
let g:prettier#config#tab_width = 2 
let g:prettier#config#use_tabs = 'false'

" -----------go development---------------

" vim-go
nmap <leader>o :GoDef<CR>
nmap <leader>p :GoDefPop<CR>

nmap <leader>bb :GoCallers<CR>
nmap <leader>vv :GoVet<CR>

nmap <leader>tt :GoTest<CR>
nmap <leader>tf :GoTestFunc<CR>

let g:go_imports_autosave = 1 
let g:go_diagnostics_level = 1

" au BufWritePost *.go GoDiagnostics

set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
