vim.api.nvim_create_user_command(
  "Codespell",
  function() vim.cmd("!codespell --check-hidden --write-changes " .. vim.fn.expand "%:p") end,
  {}
)

return {
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "codespell",
      })
      opts.methods.formatting = false
    end,
  },
}
