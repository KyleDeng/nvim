-- symbols-outline.nvim with fix for Neovim 0.12+ compatibility
return {
  "simrat39/symbols-outline.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    -- Patch the jsx.lua file to fix compatibility issue with Neovim 0.12+
    local jsx = require("symbols-outline.utils.jsx")

    -- Override the get_symbols function with a fixed version
    jsx.get_symbols = function()
      local bufnr = 0

      -- Use the new Treesitter API for Neovim 0.12+
      local ok, parser = pcall(vim.treesitter.get_parser, bufnr)

      if not ok or parser == nil then
        return {}
      end

      local root = parser:parse()[1]:root()

      if root == nil then
        return {}
      end

      return jsx.parse_ts(root, nil, bufnr)
    end

    -- Apply the original configuration
    require("symbols-outline").setup({
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = "right",
      relative_width = true,
      width = 20,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = "Pmenu",
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { "", "" },
      wrap = false,
      keymaps = {
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        hover_symbol = "<C-space>",
        toggle_preview = "h",
        rename_symbol = "r",
        code_actions = "a",
        fold = "c",
        unfold = "o",
        fold_all = "C",
        unfold_all = "O",
        fold_reset = "R",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "󰕳", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "󰫰", hl = "@type" },
        Method = { icon = "󱎥", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "󰫲", hl = "@type" },
        Interface = { icon = "󰫶", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "󰫧", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "󰅳", hl = "@string" },
        Number = { icon = "", hl = "@number" },
        Boolean = { icon = "", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "🔐", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "", hl = "@type" },
        Event = { icon = "", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "󰡀", hl = "@function" },
        Fragment = { icon = "󰻋", hl = "@constant" },
      },
    })
  end,
}
