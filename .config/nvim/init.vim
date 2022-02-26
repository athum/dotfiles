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
" TODO(alice): https://www.brianstorti.com/vim-registers/
vnoremap mm "+y
nnoremap <leader>inn i<cr><cr><esc>ki

" a pretty vim comment, inserting new lines above and below
nnoremap <leader>- i" ----------   ----------<esc>11hi

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
" this seems to affect performance a lot atm
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " for programming in go

" auto-completion plugins
" TODO(alice): figure out how this all works
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " for looking for files
Plug 'junegunn/fzf.vim' " vim specific component
Plug 'lifepillar/vim-colortemplate'
Plug 'lifepillar/vim-solarized8'
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary' " commenting
Plug 'tpope/vim-fugitive' " git blame 

" HOW-TO:
" change delimiters: cs"' changes from " to '
" remove delimiters: ds" deletes surrounding quotes
" visual mode: highlight, then S" surrounds text with quotes
" and more...
Plug 'tpope/vim-surround' " surrounding text in brackets, etc.
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

" TODO(alice): This diff border highlighting is ugly 
" but not in a crippling way. Consider changing.
nnoremap <leader>ldf :Gvdiffsplit<cr>
nnoremap <leader>ga :Git add %<cr>
nnoremap <leader>grs :Git restore %<cr>

" ---------- vim-airline ----------

let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename
let g:airline#extensions#branch#enabled = 1 " show git branch

" ---------- vim-arline-theme ----------

let g:airline_theme='deus' " pretty colors

" ---------- colorscheme ----------

set termguicolors
set background=dark
colorscheme solarized8

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

" ---------- lsps ----------

lua require'lspconfig'.gopls.setup{}

nnoremap <leader>o <cmd>lua vim.lsp.buf.definition()<CR>zz
nnoremap <leader>p <C-o>zz
nnoremap <leader>bb <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader><C-f> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menu,menuone,noselect

lua <<EOF

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- configuring goimports on save, taken from 
  -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md
  function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF

autocmd BufWritePre *.go lua goimports(1000)

" autoformatting
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
" TODO(alice): Add formatting for JS, TS, TSX, JSX, HTML, CSS, JSON files.
set colorcolumn=80
" ---------- FIN ----------
