return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    -- build = "cargo build --release",
    opts = {
      fuzzy = {
        implementation = "prefer_rust",
      },
    },
  },
}
