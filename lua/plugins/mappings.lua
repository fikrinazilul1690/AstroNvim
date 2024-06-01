return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
          ["<leader>h"] = { desc = (vim.g.icons_enabled and "󱡀 " or "") .. "Harpoon", name = "Harpoon" },
          ["<leader>b"] = { name = "Buffers" },
          ["<leader>H"] = {
            function()
              local wins = vim.api.nvim_tabpage_list_wins(0)
              if #wins > 1 and vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype == "neo-tree" then
                vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
              end
              require("alpha").start(false)
            end,
            desc = "Home Screen",
          },
          ["<Leader>c"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start() end
            end,
            desc = "Close buffer",
          },
          ["<M-i>"] = { "<CMD>ToggleTerm<CR>" },
        },
        t = {
          -- setting a mapping to false will disable it
          ["<esc>"] = false,
          ["<M-i>"] = { "<CMD>ToggleTerm<CR>" },
        },
        i = {
          ["<A-h>"] = { "<Left>", desc = "Move cursor left" },
          ["<A-j>"] = { "<Down>", desc = "Move cursor down" },
          ["<A-k>"] = { "<Up>", desc = "Move cursor up" },
          ["<A-l>"] = { "<Right>", desc = "Move cursor right" },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
