
set encoding=UTF-8
set hidden
set nobackup
set noswapfile
set number
set numberwidth=4
set mouse=a
set relativenumber
set signcolumn=yes
set tabstop=2
set shiftwidth=2
set expandtab
set termguicolors
set undofile

nnoremap <SPACE> <Nop>
let mapleader = " "

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'ryanoasis/vim-devicons'

Plug 'lewis6991/gitsigns.nvim'

Plug 'tpope/vim-surround'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()


colorscheme dracula

set guifont=DroidSansMono\ Nerd\ Font:h11

" lewis6991/gitsigns.nvim {{{
lua << EOF
  require('gitsigns').setup({})
EOF
" }}}

lua << EOF
  require('telescope').setup {
    extensions = {
      file_browser = {}
      }
    }

  require("telescope").load_extension "file_browser"
EOF

lua << EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'html', 'javascript', 'typescript', 'tsx', 'css', 'json', 'ruby', 'python' },
    highlight = {
      enable = true
    }
  }
EOF

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

lua << END
  require('lualine').setup()
END
