return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      -- add your options that should be passed to the setup() function here
      default_component_configs = { git_status = { symbols = { unstaged = "󱈸" } } },
      window = { width = 30, mappings = { ["l"] = "open", ["h"] = "close_node" } },
    },
  },
}
