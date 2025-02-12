return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    priority = 900,
    config = function()
      require("mini.statusline").setup()
      require("mini.ai").setup()
      require("mini.align").setup()
      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.jump").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.pick").setup()
      require("mini.extra").setup()
      require("mini.trailspace").setup()
      require("mini.operators").setup()
      require("mini.icons").setup()
      require("mini.move").setup()
    end,
    keys = {
      -- Pick
      { '<leader>ff', '<cmd>Pick files<cr>' },
      { '<leader>fg', '<cmd>Pick grep_live<cr>' },
      { '<leader>fb', '<cmd>Pick buffers<cr>' },
      { '<leader>fh', '<cmd>Pick history<cr>' },
      { '<leader>fs', '<cmd>Pick help<cr>' },
      { '<leader>fc', '<cmd>Pick commands<cr>' },
      { '<leader>fk', '<cmd>Pick keymaps<cr>' },

      -- Trailspace
      { '<leader>tr', function() MiniTrailspace.trim() end },
      { '<leader>tl', function() MiniTrailspace.trim_last_lines() end }
    }
  }
}
