return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.golines,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.diagnostics.codespell,
      null_ls.builtins.formatting.codespell,
      null_ls.builtins.formatting.sql_formatter.with {
        extra_args = function(params)
          local configFile = "sqlformatter.json"
          local rootDir = require("null-ls.utils").root_pattern(configFile)(params.bufname)
          if rootDir then return { "--config", rootDir .. "/" .. configFile } end
          return { "-l", "postgresql" }
        end,
      },
    }
    return config -- return final config table
  end,
}
