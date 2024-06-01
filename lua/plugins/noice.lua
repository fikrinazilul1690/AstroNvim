return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false,
      long_message_to_split = false,
    },
    views = {
      cmdline_popup = {
        position = {
          row = 15,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popup = {
        size = {
          width = 80,
        },
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "change",
        },
        opts = { skip = true },
      },
      {
        view = "popup",
        filter = {
          event = "msg_show",
          cmdline = "lua print",
        },
      },
    },
    cmdline = {
      view = "cmdline_popup",
    },
  },
}
