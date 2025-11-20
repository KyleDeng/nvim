return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- 这是一个列表，包含您希望 Mason 自动安装的 LSP 服务器名称。
      -- 请使用 Mason 官方文档中的标准服务器名称（通常与 nvim-lspconfig 的名称相同）。
      ensure_installed = {
        "lua_ls",            -- Lua
        -- "rust_analyzer",     -- Rust
        "eslint",          -- TypeScript/JavaScript
        -- "html",              -- HTML
        -- "cssls",             -- CSS
        "pylsp",             -- Python
        "clangd",            -- C/C++
        -- ... 添加您需要的其他服务器名称
      },
    },
  },

  -- 您可能还需要为 nvim-treesitter 配置解析器 (Parser)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        -- "rust",
        "typescript",
        "javascript",
        -- "html",
        -- "css",
        "python",
        "c",
        "cpp",
        "bash",
        "json",
        "markdown",
        "markdown_inline",
        -- "query",
        -- "regex",
        -- "tsx",
        "vim",
        "yaml",
      }
    }
  }
}
