return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = function(_, opts)
      -- Merge custom fuzzy implementation setting
      opts.fuzzy = require("astrocore").extend_tbl(opts.fuzzy or {}, {
        implementation = "prefer_rust",
      })

      -- You can add more configurations here, if needed

      return opts
    end,
  },
}
