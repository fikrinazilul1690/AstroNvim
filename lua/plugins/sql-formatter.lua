vim.g.sql_type_default = "postgresql"
vim.g.sql_dialect = "postgresql"
vim.api.nvim_create_user_command("SQLSetDialect", function ()
  local dialect = vim.fn.input "Dialect: "
  if dialect ~= "" then
    vim.g.sql_dialect = dialect
  end
end, {})
vim.api.nvim_create_user_command("SQLGetDialect", function ()
  print(vim.g.sql_dialect)
end, {})
return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sql-formatter" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.formatters_by_ft then opts.formatters_by_ft = {} end
      opts.formatters_by_ft["sql"] = { "sql_formatter" }
      if not opts.formatters then opts.formatters = {} end
      opts.formatters["sql_formatter"] = {
        inherit = false,
        command = "sql-formatter",
        args = { "-l", vim.g.sql_dialect },
      }
    end,
  },
}
