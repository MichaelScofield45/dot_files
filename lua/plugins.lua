return {
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    "kylechui/nvim-surround", 
    config = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
	opts = {
	  theme = "night",
	},
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { 
      "hrsh7th/cmp-buffer", 
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
    },
  },
  "L3MON4D3/LuaSnip",
  {
    "nvim-telescope/telescope.nvim",
	lazy = true,
  },
  "nvim-lua/plenary.nvim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
    opts = {
      theme = "tokyonight",
    },
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    config = true,
  },
}
