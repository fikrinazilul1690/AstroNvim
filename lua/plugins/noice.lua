return {
  "folke/noice.nvim",
  opts = function(_, opts)
    -- Extend the 'presets' field in opts using astrocore.extend_tbl
    opts.presets = require("astrocore").extend_tbl(opts.presets or {}, {
      bottom_search = false,
      long_message_to_split = false,
    })

    -- Extend the 'views' field in opts using astrocore.extend_tbl
    opts.views = require("astrocore").extend_tbl(opts.views or {}, {
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
    })

    -- Extend the 'routes' field in opts using astrocore.extend_tbl
    opts.routes = require("astrocore").extend_tbl(opts.routes or {}, {
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
        filter = {
          event = "msg_show",
          kind = "wmsg",
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
    })

    -- Extend the 'cmdline' field in opts using astrocore.extend_tbl
    opts.cmdline = require("astrocore").extend_tbl(opts.cmdline or {}, {
      view = "cmdline_popup",
    })

    return opts
  end,
}
