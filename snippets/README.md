# 自定义代码片段使用指南

## 📦 已配置的内容

1. **LuaSnip** - 强大的片段引擎
2. **friendly-snippets** - 社区片段集合
3. **自定义片段目录** - 两种格式支持

## ⌨️ 快捷键

- `<C-k>` - 展开片段或跳转到下一个位置
- `<C-j>` - 跳转到上一个位置
- `<C-l>` - 切换选项（如果有多个选择）

## 📝 添加自定义片段的两种方法

### 方法 1: VSCode 格式 (JSON) - 简单易用

在 `~/.config/nvim/snippets/` 目录下创建 JSON 文件：

- `global.json` - 所有文件类型可用
- `python.json` - 仅 Python 文件可用
- `javascript.json` - 仅 JavaScript 文件可用
- `[filetype].json` - 特定文件类型可用

**JSON 格式示例：**
```json
{
  "Snippet Name": {
    "prefix": "trigger",      // 触发词
    "body": [                 // 片段内容
      "line 1",
      "line 2 with $1",       // $1 是第一个光标位置
      "line 3 with ${2:default}" // $2 是第二个位置，带默认值
    ],
    "description": "描述"
  }
}
```

**变量支持：**
- `$1, $2, ...` - 光标跳转位置
- `${1:default}` - 带默认值的位置
- `$0` - 最终光标位置
- `$TM_FILENAME` - 当前文件名
- `$TM_CURRENT_LINE` - 当前行内容
- `$TM_SELECTED_TEXT` - 选中的文本

### 方法 2: Lua 格式 - 更强大

在 `~/.config/nvim/luasnippets/` 目录下创建 Lua 文件：

- `all.lua` - 包含所有文件类型和特定类型的片段

**Lua 格式优势：**
- 动态内容（日期、时间、用户名等）
- 条件逻辑
- 正则表达式转换
- 选择节点（多个选项）
- 函数节点（动态生成内容）

**Lua 格式示例：**
```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- 所有文件类型
  all = {
    s("trigger", {
      t("Static text "),
      i(1, "placeholder"),
      t(" more text"),
    }),
  },

  -- 特定文件类型
  python = {
    s("def", {
      t("def "), i(1, "name"),
      t("("), i(2, "params"), t("):"),
      t({"", "    "}), i(3, "pass"),
    }),
  },
}
```

## 🎯 已创建的示例片段

### 全局片段 (所有文件类型)
- `log` - console.log
- `todo` - TODO 注释
- `try` - try-catch 块
- `date` - 当前日期
- `time` - 当前时间
- `header` - 文件头注释

### JavaScript/TypeScript
- `rfc` - React 函数组件
- `afn` - 异步箭头函数
- `rfce` - 高级 React 组件（Lua 格式）
- `clg` - console.log 带变量名

### Python
- `main` - main 函数模板
- `class` - 类定义
- `def` - 函数定义
- `pp` - debug print
- `lc` - 列表推导式
- `dataclass` - dataclass 装饰器
- `async` - 异步函数

### Lua (Neovim 配置)
- `fun` - 函数定义
- `lfun` - 局部函数
- `module` - 模块模板
- `req` - require 语句
- `keymap` - Neovim 按键映射
- `autocmd` - Neovim 自动命令
- `plugin` - lazy.nvim 插件配置

## 💡 使用技巧

1. **查看可用片段**：在 Insert 模式下输入触发词的前几个字母
2. **刷新片段**：修改片段文件后，重启 Neovim 或运行 `:LuaSnipUnlinkCurrent`
3. **调试片段**：使用 `:lua require("luasnip").log.set_loglevel("debug")`

## 📁 目录结构
```
~/.config/nvim/
├── snippets/          # VSCode 格式片段
│   ├── global.json    # 全局片段
│   ├── python.json    # Python 片段
│   └── lua.json       # Lua 片段
└── luasnippets/       # Lua 格式片段
    └── all.lua        # 所有片段定义
```

## 🔗 参考资源
- [LuaSnip 文档](https://github.com/L3MON4D3/LuaSnip)
- [VSCode Snippet 语法](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
- [Friendly Snippets](https://github.com/rafamadriz/friendly-snippets)