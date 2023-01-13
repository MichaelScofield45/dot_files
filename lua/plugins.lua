---------------------------------Plug-ins---------------------------------------
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end  }
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use { 'kylechui/nvim-surround', config = function() require('nvim-surround').setup() end }
  use { 'rebelot/kanagawa.nvim', disable = true }
  use 'folke/tokyonight.nvim'
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
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup{
      options = {
        theme = "tokyonight"
      }
    }
    end
  }
  -- use 'jbyuki/nabla.nvim'
  use {
   'nvim-neorg/neorg',
    run = ":Neorg sync-parsers",
    config = function()
      require('neorg').setup {
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
