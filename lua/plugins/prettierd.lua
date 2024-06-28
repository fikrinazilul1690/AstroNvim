return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      if not opts.handlers then opts.handlers = {} end
      opts.handlers.prettierd = function(source_name, methods)
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
              or utils.root_has_file ".prettierrc"
              or utils.root_has_file ".prettierrc.json"
              or utils.root_has_file ".prettierrc.js"
          end,
        })
      end
    end,
  },
}
