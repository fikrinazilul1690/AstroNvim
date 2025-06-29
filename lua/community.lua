-- if false then return {} end -- WARN: UNCOMMENT THIS LINE TO DEACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.full-dadbod" },
  -- { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.mcphub-nvim" },
  { import = "astrocommunity.completion.blink-cmp" },
  -- { import = "astrocommunity.completion.nvim-cmp" },
  { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.game.leetcode-nvim" },
  { import = "astrocommunity.motion.harpoon" },
}
