return {
  {
    -- 彩虹括号
    -- "p00f/nvim-ts-rainbow",
    "HiPhish/nvim-ts-rainbow2",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        -- disable = { "jsx", "cpp" },
        -- Which query to use for finding delimiters
        -- query = "rainbow-parens",
        -- Highlight the entire buffer all at once
        -- strategy = require("ts-rainbow").strategy.global,
        colors = {
          "#999999",
          "#cc241d",
          "#a89984",
          "#b16286",
          "#d79921",
          "#689d6a",
          "#d65d0e",
          "#458588",
        },
        termcolors = {
          "Red",
          "Green",
          "Yellow",
          "Blue",
          "Magenta",
          "Cyan",
          "White",
        },
        -- colors = {
        --   "#999999",
        --   "#8CCBEA",
        --   "#A4E57E",
        --   "#FFDB72",
        --   "#FF7272",
        --   "#FFB3FF",
        --   "#9999FF",
        -- },
        -- termcolors = {
        --   "#111111",
        --   "#8CCBEA",
        --   "#A4E57E",
        --   "#FFDB72",
        --   "#FF7272",
        --   "#FFB3FF",
        --   "#9999FF",
        -- },
      },
    },
  },
}
