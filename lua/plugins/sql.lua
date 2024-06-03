vim.g.sql_type_default = "postgresql"

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.formatters_by_ft then opts.formatters_by_ft = {} end
      opts.formatters_by_ft["sql"] = { "pg_format" }
      opts.formatters_by_ft["pgsql"] = { "pg_format" }
    end,
  },
}
