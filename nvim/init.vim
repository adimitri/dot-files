
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

lua require('plugins')
lua require('mappings')

nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

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

lua << END
  require('lualine').setup()
END
