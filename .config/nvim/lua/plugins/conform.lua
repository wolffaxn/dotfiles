return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        yaml = { "yamlfmt" },
      },
      formatters = {
        yamlfmt = {
          command = "yamlfmt",
          args = { "-formatter", "basic", "-indentless_arrays=true" },
        },
      },
    },
  },
}
