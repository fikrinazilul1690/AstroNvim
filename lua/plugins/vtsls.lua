return {
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.config = require("astrocore").extend_tbl(opts.config or {}, {
        vtsls = {
          capabilities = {
            workspace = {
              didChangeConfiguration = {
                dynamicRegistration = true,
              },
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
        },
      })
    end,
  },
}
