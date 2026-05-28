return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = {
        preset = {
          header = [[

All Limits Are Self Imposed
          ]],
        },
      }
      return opts
    end,
  },
}
