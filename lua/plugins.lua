local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


---------------------------------Plug-ins---------------------------------------
return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use 'b3nj5m1n/kommentary'
  use {
      'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup{} end
  }
  use({
      "kylechui/nvim-surround",
      config = function()
          require("nvim-surround").setup({})
      end,
  })
  use 'rebelot/kanagawa.nvim'
  use {
    'folke/tokyonight.nvim', 
    config = require('tokyonight').setup({
        style = "night"
    })
  }
  use 'TimUntersberger/neogit'
  use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig'
  use { 'hrsh7th/nvim-cmp' , requires = { 'hrsh7th/cmp-buffer', 
										  'hrsh7th/cmp-nvim-lua',
										  'hrsh7th/cmp-nvim-lsp',
                                          'saadparwaiz1/cmp_luasnip',
										  'hrsh7th/cmp-path' } 
  }
  use 'L3MON4D3/LuaSnip'
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/vim-be-good'
  use {
   "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
          tag = "*",
        -- Tell Neorg what modules to load
          load = {
              ["core.defaults"] = {}, -- Load all the default modules
              ["core.keybinds"] = { -- Configure core.keybinds
                  config = {
                      default_keybinds = true, -- Generate the default keybinds
                      neorg_leader = "<Leader>o", -- This is the default if unspecified
                  }
              },
              ["core.norg.concealer"] = {
                  config = {
                      folds = true,
                  }
              }, -- Allows for use of icons
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
              },
              ["core.export"] = {},
              ["core.export.markdown"] = {},
          },
        }
  end,
  }
end)
