return {
  {
    --Align
    "echasnovski/mini.align",
    version = "*",
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        start = "<leader>aa",
        start_with_preview = "<leader>aA",
      },

      -- Default options controlling alignment process
      options = {
        split_pattern = "",
        justify_side = "left",
        merge_delimiter = "",
      },

      -- Default steps performing alignment (if `nil`, default is used)
      steps = {
        pre_split = {},
        split = nil,
        pre_justify = {},
        justify = nil,
        pre_merge = {},
        merge = nil,
      },

      -- Whether to disable showing non-error feedback
      silent = false,
    },
  },
}
