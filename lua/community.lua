-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.game.leetcode-nvim" },
  { import = "astrocommunity.motion.harpoon" },
}
