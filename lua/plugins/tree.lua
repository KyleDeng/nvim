return {
  {
    -- 不使用snacks提供的explorer功能
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false
      },
    },
    keys = {
      -- Override the default <leader>fe binding from snacks
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- Load neo-tree when opening a directory
    lazy = false,
    priority = 1000,
    -- Auto open neo-tree when opening a directory
    init = function()
      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Open neo-tree when opening a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          -- Check if we opened a directory
          local directory = vim.fn.isdirectory(data.file) == 1

          if not directory then
            return
          end

          -- Create a new empty buffer
          vim.cmd.enew()

          -- Wipe the directory buffer
          vim.api.nvim_buf_delete(data.buf, { force = true })

          -- Open neo-tree
          require("neo-tree.command").execute({
            dir = data.file,
            position = "left",
          })
        end,
      })
    end,
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.fn.expand("%:p:h") })
        end,
        desc = "Explorer NeoTree (file dir)",
      },
      -- {
      --   "<leader>ge",
      --   function()
      --     require("neo-tree.command").execute({ source = "git_status", toggle = true })
      --   end,
      --   desc = "Git Explorer",
      -- },
      -- {
      --   "<leader>be",
      --   function()
      --     require("neo-tree.command").execute({ source = "buffers", toggle = true })
      --   end,
      --   desc = "Buffer Explorer",
      -- },
    },
    opts = {
      default_component_configs = { git_status = { symbols = { unstaged = "󱈸" } } },
      window = { width = 30, mappings = { ["l"] = "open", ["h"] = "close_node" } },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_ignored = true, -- hide files that are ignored by other gitignore-like files
          -- other gitignore-like files, in descending order of precedence.
          ignore_files = {
            ".neotreeignore",
            ".ignore",
            -- ".rgignore"
          },
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            --"node_modules"
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            "output",
            "out",
            "include",
            "libs",
            "build",
          },
          always_show_by_pattern = { -- uses glob style patterns
            --".env*",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            --".DS_Store",
            --"thumbs.db"
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        window = {
          mappings = {
            ["F"] = "fuzzy_finder",
            ["/"] = "",
          },
        },
        follow_current_file = {
          enabled = false, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      buffers = {
        follow_current_file = {
          enabled = false, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
    },
  }
}
