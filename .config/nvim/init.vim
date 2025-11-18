" ---------- general config ----------

set relativenumber " sets line numbers relative to current line
set number " displays current line number

set ignorecase " case insensitive search
set smartcase " uses case sensitive search with capital letters
set confirm " confirms saves for changed files

set tabstop=4 " sets the width of the TAB character
set shiftwidth=4 " changes what happens when you use >>, <<, or == (automatic indentation)

" ---------- key bindings ----------

let mapleader ="\<Space>"

" configuring neovim, must have environment variable pointing to this file
nnoremap <leader>nvc :vsplit $NVIMCFG<cr>
nnoremap <leader>nvs :so $NVIMCFG<cr>

" copy into OS clipboard
" https://www.brianstorti.com/vim-registers/
vnoremap mm "+y
nnoremap <leader>inn i<cr><cr><esc>ki

" ---------- buffer management ----------

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

" swap side-by-side windows around
nnoremap <leader>ww <C-w>x

" ---------- >^.^< plugins >^.^< ----------

call plug#begin('$HOME/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter' " shows git changes
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " for looking for files
Plug 'junegunn/fzf.vim' " vim specific component
Plug 'lifepillar/vim-colortemplate'
Plug 'lifepillar/vim-solarized8'
Plug 'sainnhe/everforest'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary' " commenting
Plug 'tpope/vim-fugitive' " git blame 

" HOW-TO:
" change delimiters: cs"' changes from " to '
" remove delimiters: ds" deletes surrounding quotes
" visual mode: highlight, then S" surrounds text with quotes
" and more...
Plug 'tpope/vim-surround' " surrounding text in brackets, etc.
Plug 'tpope/vim-rhubarb' " surrounding text in brackets, etc.
Plug 'vim-airline/vim-airline' " buffer management
Plug 'vim-airline/vim-airline-themes' " buffer management themes
" Plug 'yggdroot/indentLine' " for indentation guides

call plug#end()

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pc :PlugClean<cr>

" ---------- fzf ----------

nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>

" ---------- vim-fugitive ----------

nnoremap <leader>who :Git blame<cr>
nnoremap <leader>gdf :Git diff<cr>

" This diff border highlighting is ugly 
" but not in a crippling way. Consider changing.
nnoremap <leader>ldf :Gvdiffsplit<cr>
nnoremap <leader>ga :Git add %<cr>
nnoremap <leader>grs :Git restore %<cr>
nnoremap <leader>gb :GBrowse<cr>

" ---------- vim-airline ----------

let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename
let g:airline#extensions#branch#enabled = 1 " show git branch

" ---------- vim-arline-theme ----------

let g:airline_theme='deus' " pretty colors

" ---------- colorscheme ----------

"set termguicolors
"colorscheme solarized8
"set background dark
colorscheme everforest

" ---------- aesthetics ----------

highlight clear LineNr
highlight clear VertSplit
set cursorline
" highlight CursorLine ctermbg=30 " changes the cursor line color to a LOVELY slate grey
" highlight Folded ctermfg=30 " changes folds to an EXQUISITE deep turquoise

" ---------- vim-gitgutter ----------

highlight clear SignColumn
highlight GitGutterAdd ctermfg=30
highlight GitGutterChange ctermfg=103
highlight GitGutterDelete ctermfg=163

set colorcolumn=80

" ---------- FIN ----------
