return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    cmd = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
    keys = {},
  },
}
