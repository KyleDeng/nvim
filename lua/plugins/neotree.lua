return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      -- add your options that should be passed to the setup() function here
      default_component_configs = { git_status = { symbols = { unstaged = "󱈸" } } },
      window = { width = 30, mappings = { ["l"] = "open", ["h"] = "close_node" } },
      filesystem = {
        follow_current_file = false,
        filtered_items = {
          always_show = {
            "output",
            "apps",
            "components",
            "vendor",
            "adapter",
            "application_components",
            "application_drivers",
            "include",
            "libs",
            "build",
          },
        },
        window = {
          mappings = {
            ["F"] = "fuzzy_finder",
            ["/"] = "",
          },
        },
      },
      buffers = {
        follow_current_file = false, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
      },
    },
  },
}
