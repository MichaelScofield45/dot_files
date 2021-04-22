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
      options = { theme = 'dracula' }
      }
    end
  }
  --]]

  -- spaceduck (colorscheme)
  use 'pineapplegiant/spaceduck'

  -- tree-sitter
  use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate'}

end)
