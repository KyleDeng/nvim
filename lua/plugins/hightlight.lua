return {
  {
    -- 选择单词高亮
    "Mr-LLLLL/interestingwords.nvim",
    opts = {
      colors = { "#8CCBEA", "#A4E57E", "#FFDB72", "#FF7272", "#FFB3FF", "#9999FF" },
      search_count = true,
      navigation = false,
      search_key = ",m",
      cancel_search_key = ",M",
      color_key = ",k",
      cancel_color_key = ",K",
    },
  },
  {
    -- 范围高亮
    "winston0410/range-highlight.nvim",
    dependencies = "winston0410/cmd-parser.nvim",
    opts = {
      highlight = "Visual",
      highlight_with_out_range = {
        d = true,
        delete = true,
        m = true,
        move = true,
        y = true,
        yank = true,
        c = true,
        change = true,
        j = true,
        join = true,
        ["<"] = true,
        [">"] = true,
        s = true,
        subsititue = true,
        sno = true,
        snomagic = true,
        sm = true,
        smagic = true,
        ret = true,
        retab = true,
        t = true,
        co = true,
        copy = true,
        ce = true,
        center = true,
        ri = true,
        right = true,
        le = true,
        left = true,
        sor = true,
        sort = true,
      },
    },
  },
}
