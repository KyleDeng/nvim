return {
  {
    -- 彩虹括号
    -- "p00f/nvim-ts-rainbow",
    "HiPhish/nvim-ts-rainbow2",
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
