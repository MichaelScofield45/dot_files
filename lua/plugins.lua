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
        options = { 
          theme = 'gruvbox' 
        }
      }
    end
  }
  --]]

  -- lush theme engine
  use 'rktjmp/lush.nvim'
  
  -- gruvbox, in Lua
  use 'npxbr/gruvbox.nvim'

  -- tree-sitter support
  use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate'}

  -- lsp config support
  use 'neovim/nvim-lspconfig'

  -- Completion engine written in Lua.
  use 'hrsh7th/nvim-compe'

  -- Snippet support
  use 'hrsh7th/vim-vsnip'

  -- Snippet integration with LSP
  use 'hrsh7th/vim-vsnip-integ'

  -- plenar from TJ (dep. of neorg)
  use 'nvim-lua/plenary.nvim'
  
  -- neorg
  use {
   "vhyrro/neorg",
    config = function()
      require('neorg').setup {
        -- Tell Neorg what modules to load
          load = {
              ["core.defaults"] = {}, -- Load all the default modules
              ["core.keybinds"] = { -- Configure core.keybinds
                  config = {
                      default_keybinds = true, -- Generate the default keybinds
                      neorg_leader = "<Leader>o" -- This is the default if unspecified
                  }
              },
              ["core.norg.concealer"] = {}, -- Allows for use of icons
              ["core.norg.dirman"] = { -- Manage your directories with Neorg
                  config = {
                      workspaces = {
                          my_workspace = "~/neorg"
                      }
                  }
              }
          },
        }
  end,
}
end)
