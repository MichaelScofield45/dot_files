local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


---------------------------------Plug-ins---------------------------------------
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lualine 
  ---[[
  use { 'hoob3rt/lualine.nvim', 
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }, 
      config = function() require('lualine').setup {
      options = { theme = 'gruvbox' }
      }
    end
  }
  --]]

  -- spaceduck (colorscheme)
  use 'pineapplegiant/spaceduck'

  -- gruvbox8
  use 'lifepillar/vim-gruvbox8'

  -- colorbuddy (lua colorschemes)
  use 'tjdevries/colorbuddy.nvim'

  -- Material (lua colorscheme)
  use 'marko-cerovac/material.nvim'

  -- tree-sitter
  use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate'}

end)
