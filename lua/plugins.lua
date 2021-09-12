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
  use { 'shadmansaleh/lualine.nvim', 
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }, 
      config = function() require('lualine').setup {
        options = { 
          theme = 'onedark' 
        }
      }
    end
  }
  --]]

  -- lush theme engine
  -- use 'rktjmp/lush.nvim'
  
  -- moonfly, colorful lua colorscheme
  -- use 'bluz71/vim-moonfly-colors'

  -- gruvbox, in Lua
  -- use 'ellisonleao/gruvbox.nvim'

  -- Easy commenting
  use 'b3nj5m1n/kommentary'

  -- onedark, in Lua
  use 'navarasu/onedark.nvim'

  -- Magit for neovim
  use 'TimUntersberger/neogit'

  -- tree-sitter support
  use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate'}

  -- lsp config support
  use 'neovim/nvim-lspconfig'

  -- Better nvim-compe
  use { 'hrsh7th/nvim-cmp' , requires = { 'hrsh7th/cmp-buffer', 
										  'hrsh7th/cmp-nvim-lua',
										  'hrsh7th/cmp-nvim-lsp',
										  'hrsh7th/cmp-vsnip',
										  'hrsh7th/cmp-path' } 
  }

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
              },
              ["core.norg.completion"] = { -- Set nvim-cmp for completion
                  config = {
                      engine = "nvim-cmp"
                  }
              }
          },
        }
  end,
}
end)
