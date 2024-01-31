return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    cmd = { "Harpoon " },
    keys = {
      {
        "<leader>hm",
        function()
          local conf = require("telescope.config").values
          local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
              .new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table {
                  results = file_paths,
                },
                previewer = conf.file_previewer {},
                sorter = conf.generic_sorter {},
              })
              :find()
          end
          toggle_telescope(require("harpoon"):list())
        end,
        desc = "Show marks in Telescope",
      },
      { "<leader>ha", function() require("harpoon"):list():append() end, desc = "Add file" },
      { "<leader>hr", function() require("harpoon"):list():remove() end, desc = "Remove file" },
      { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Goto previous mark" },
      { "<C-n>", function() require("harpoon"):list():next() end, desc = "Goto next mark" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>m",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle Treesitter Join",
      },
    },
    cmd = { "TSJToggle", "TSJJoin", "TSJSplit" },
    opts = { use_default_keymaps = false },
  },
  {
    "kevinhwang91/nvim-bqf",
    dependencies = { "junegunn/fzf" },
    ft = "qf",
  },
  { "junegunn/fzf" },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Troubel" },
    keys = {
      { "<leader>x", desc = "Trouble" },
      { "<leader>xX", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xx", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xq", "<CMD>TroubleToggle quickfix<CR>", desc = "Workspace Diagnostics (Trouble)" },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<ESC>" },
        cancel = "<C-e>",
      },
    },
  },
}
