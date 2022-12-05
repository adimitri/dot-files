local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim and installs/updates/removes plugins
-- whent this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({ "dracula/vim", as = "dracula" })

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("szw/vim-maximizer") -- maximizes and restores current window

  use("tpope/vim-surround") -- add, delete, change surrounding text

  use("numToStr/Comment.nvim")

  -- file explorer
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ 
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing lsp servers, linters, and formatters
  use("williamboman/mason.nvim") -- managing lsp servers, linters, and formatters
  use("williamboman/mason-lspconfig.nvim") -- interface between mason and lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file and update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting and linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters and linters
  use("jayp0521/mason-null-ls.nvim") -- interface between mason and null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- Keep this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
