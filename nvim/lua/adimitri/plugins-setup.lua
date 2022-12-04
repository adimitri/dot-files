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

  use("tpope/vim-surround")

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

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- Keep this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
