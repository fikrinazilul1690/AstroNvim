return {
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.config = require("astrocore").extend_tbl(opts.config or {}, {
        gopls = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true,
                unusedvariable = true,
              },
            },
          },
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      for key, value in pairs(opts.ensure_installed) do
        if value == "goimports" then
          table.remove(opts.ensure_installed, key)
          break
        end
      end
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "golines", "goimports-reviser" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.formatters_by_ft then opts.formatters_by_ft = {} end
      opts.formatters_by_ft["go"] = { "goimports-reviser", "gofumpt", "golines" }
    end,
  },
}
