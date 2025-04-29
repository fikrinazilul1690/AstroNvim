return {
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "codespell",
      })

      if not opts.handlers then opts.handlers = {} end
      opts.handlers.codespell = function(source_name, methods)
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.codespell.with {
          method = null_ls.methods.DIAGNOSTICS,
        })
      end
    end,
  },
}
