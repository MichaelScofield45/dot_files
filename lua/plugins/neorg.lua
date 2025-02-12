return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.keybinds"] = {},
          ["core.ui.calendar"] = {},
        }
      })
      vim.wo.conceallevel = 2
    end,
  }
}
