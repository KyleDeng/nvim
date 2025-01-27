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
        hlgroups = {
          -- The colours are intentionally not in the usual order to make
          -- the contrast between them stronger
          "TSRainbowCyan",
          "TSRainbowYellow",
          "TSRainbowBlue",
          "TSRainbowOrange",
          "TSRainbowGreen",
          "TSRainbowViolet",
          "TSRainbowRed",
        },
      },
    },
  },
  {
    'TobinPalmer/rayso.nvim',
    cmd = { 'Rayso' },
    config = function()
      require('rayso').setup {}
    end
  },
}
