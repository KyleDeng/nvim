return {
  {
    --COCvim
    "neoclide/coc.nvim",
  },
  {
    --切换输入法
    "lilydjwg/fcitx.vim",
    --这里配置了好像不生效，需要到~/.local/share/nvim/lazy/fcitx.vim 里面git checkout 1.2.5
    version = "1.2.5",
  },
  {
    -- 光标单词加下划线
    "itchyny/vim-cursorword",
  },
  {
    -- 多光标操作
    "mg979/vim-visual-multi",
  },
  {
    -- git blame
    "APZelos/blamer.nvim",
  },
  {
    --html emment
    "mattn/emmet-vim",
    keys = {
      { "<leader>ke", "$<cmd>call emmet#expandAbbr(3, '')<cr>", desc = "<C-y>," },
    },
  },
  {
    -- Markdown 预览
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    -- 智能缩进
    "nmac427/guess-indent.nvim",
    opts = {
      auto_cmd = true, -- Set to false to disable automatic execution
      override_editorconfig = false, -- Set to true to override settings set by .editorconfig
      filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
        "netrw",
        "tutor",
      },
      buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
        "help",
        "nofile",
        "terminal",
        "prompt",
      },
    },
  },
  {
    -- 书签
    "tomasky/bookmarks.nvim",
    opts = { -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
      keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function(bufnr)
        local bm = require("bookmarks")
        local map = vim.keymap.set
        map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
        map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
        map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
        map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
        map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
        map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
      end,
    },
  },
  {
    -- Bufferline加上序号
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
      },
    },
  },
  --修改默认的一些按键映射
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader><space>", "<cmd>Alpha<cr>", desc = "Alpha greeter" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "", desc = "Explorer NeoTree (root dir)", remap = true },
    },
  },
}
