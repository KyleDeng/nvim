return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        -- 确保始终显示缓冲区标签
        always_show_bufferline = true,
        -- Bufferline加上序号
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
      },
    },
  },
}
