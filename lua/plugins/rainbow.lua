return {
  {
    -- 彩虹括号
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    'TobinPalmer/rayso.nvim',
    cmd = { 'Rayso' },
    config = function()
      require('rayso').setup {}
    end
  },
}
