-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move to window using the <ctrl> hjkl keys

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")
local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

vim.api.nvim_create_user_command('BDeleteOther', function()
    local current_buf = vim.api.nvim_get_current_buf()
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
        if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) then
            local buf_name = vim.api.nvim_buf_get_name(buf)
            -- 检查是否为 NeoTree 缓冲区
            if not string.match(buf_name, "neo%-tree") then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end
end, {})

--通用
map({ "n", "v" }, ",p", '"*p', { desc = "Yank paste" })
map({ "n", "v" }, ",P", '"*P', { desc = "Yank paste" })
map({ "n", "v" }, ",y", '"*y', { desc = "Yank copy" })
wk.add({
  "<leader>k", group="K-setting", icon=""
})
map("n", "<leader>ku", "vawgu", { desc = "lower case word", remap = true }) --小写
map("n", "<leader>kU", "vawU", { desc = "upper case word", remap = true }) --大写
map("n", "<leader>kr", "<cmd>e!<CR>", { desc = "refresh", remap = true }) --刷新
map("n", "<leader>ka", "ggVG", { desc = "select all", remap = true }) --全选
map("n", "<leader>kl", "<cmd>noh<cr><esc>", { desc = "No highlight", remap = true }) --取消高亮
map({"n", "v"}, "<leader>ks", ":Rayso<cr>", { desc = "Code Image", remap = true }) --代码图片

--Doxygen
wk.add({
  "<leader>kd", group="Doxygen", icon=""
})
map("n", "<leader>kdd", "<cmd>Dox<CR>", { desc = "Dox", remap = true })
map("n", "<leader>kda", "<cmd>DoxAuthor<CR>", { desc = "DoxAuthor", remap = true })
map("n", "<leader>kdl", "<cmd>DoxLic<CR>", { desc = "DoxLic", remap = true })
map("n", "<leader>kdu", "<cmd>DoxUndoc<CR>", { desc = "DoxUndoc", remap = true })
map("n", "<leader>kdb", "<cmd>DoxBlock<CR>", { desc = "DoxBlock", remap = true })

--Markdown预览
map("n", "<leader>km", "<cmd>MarkdownPreviewToggle<CR>", { desc = "MarkdownPreview", remap = true })

--bin文件
wk.add({
  "<leader>kb", group="Bin", icon=""
})
map("n", "<leader>kbb", "<cmd>%!xxd<CR>", { desc = "2hex", remap = true }) --hex
map("n", "<leader>kbr", "<cmd>%!xxd -r<CR>", { desc = "2bin", remap = true }) --bin

--寄存器
wk.add({
  "<leader>r", group="Register", icon=""
})
map("n", "<leader>rr", "<cmd>reg<CR>", { desc = "all reg", remap = true })

--跳转
wk.add({
  "<leader>j", group="Jump", icon=""
})
map("n", "<A-1>", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto Definition", remap = true })
map("n", "<A-2>", "<C-o>", { desc = "Goto Back", remap = true })
map("n", "<A-3>", "<C-i>", { desc = "Goto Forward", remap = true })
map("n", "<leader>jj", "<C-W>s<esc>gd", { desc = "Goto definition below", remap = true }) --水平分割跳转
map("n", "<leader>jv", "<C-W>v<esc>gd", { desc = "Goto definition right", remap = true }) --垂直分割跳转

--折叠
wk.add({
  "<leader>z", group="Fold", icon=""
})
map("n", "<leader>zm", "<cmd>set fdm=manual<CR>", { desc = "manual", remap = true }) --手动
map("n", "<leader>zi", "<cmd>set fdm=indent<CR>", { desc = "indent", remap = true }) --缩进
map("n", "<leader>ze", "<cmd>set fdm=expr<CR>", { desc = "expr", remap = true }) --表达式
map("n", "<leader>zs", "<cmd>set fdm=syntax<CR>", { desc = "syntax", remap = true }) --语法
map("n", "<leader>zd", "<cmd>set fdm=diff<CR>", { desc = "diff", remap = true }) --差异

--差异对比
wk.add({
  "<leader>d", group="Diff", icon=""
})
map("n", "<leader>dd", "<cmd>difft<CR>", { desc = "diff this", remap = true }) --选中比对文件
map("n", "<leader>do", "<cmd>diffo<CR>", { desc = "diff off", remap = true }) --关闭比对
map("n", "<leader>dp", "dp", { desc = "diff push", remap = true }) --同步到另一个文件
map("n", "<leader>dg", "dg", { desc = "diff get", remap = true }) --从另一个文件同步

--错误检查
wk.add({
  "<leader>e", group="Error", icon=""
})
wk.add({
  "<leader>ec", group="coc", icon=""
})
wk.add({
  "<leader>el", group="lsp", icon=""
})
map("n", "<leader>ee", "<cmd>CocEnable<cr><cmd>LspStart<cr>", { desc = "CheckEnable" })
map("n", "<leader>ed", "<cmd>CocDisable<cr><cmd>LspStop<cr>", { desc = "CheckDisable" })
--coc
map("n", "<leader>eci", "<cmd>CocList marketplace<cr>", { desc = "Coc Marketplace" })
map("n", "<leader>ece", "<cmd>CocEnable<cr>", { desc = "CocEnable" })
map("n", "<leader>ecd", "<cmd>CocDisable<cr>", { desc = "CocDisable" })
--lsp
map("n", "<leader>eli", "<cmd>LspInstall<cr>", { desc = "LspInstall" })
map("n", "<leader>ele", "<cmd>LspStart<cr>", { desc = "LspStart" })
map("n", "<leader>eld", "<cmd>LspStop<cr>", { desc = "LspStop" })

--窗口操作
map("n", "sv", "<C-w>s", { desc = "Split window below", remap = true })
map("n", "sg", "<C-w>v", { desc = "Split window right", remap = true })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })

--buffer
for i = 1, 9, 1 do
  map("n",
    string.format(",%d", i),
    string.format(":BufferLineGoToBuffer %d<CR>", i),
    { desc = string.format("Goto buffer %d", i) }) --快速跳转buffer
end
map("n", "<leader>bn", ":enew<CR>", { desc = "New empty buffer" }) --新建空buffer
map("n", ",,", ":BufferLinePick<CR>", { desc = "Pick buffer" }) --选择buffer
map("n", ",<tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" }) --选择上一个使用的buffer
map("n", "<A-h>", ":BufferLineMovePrev<cr>", { desc = "Buffer move prev" })
map("n", "<A-l>", ":BufferLineMoveNext<cr>", { desc = "Buffer move next" })
map("n", ",q", ":BDeleteOther<cr>", { desc = "Buffer close other" })

--文件路径
map("n", "<leader>fy", "<cmd>echo expand('%:p')<CR>", { desc = "Show file path" })
map("n", "<leader>fY", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Show file path" })

--align
wk.add({
  {"<leader>a", group="Align", icon="󱇂"}
})

--outline
wk.add({
  {"<leader>o", group="Outline", icon=""}
})
map("n", "<leader>oo", ":SymbolsOutline<CR>", { desc = "SymbolsOutline" })
map("n", "<leader>oc", "<cmd>CocOutline<cr>", { desc = "Coc Outline" })

--git blame
map("n", "<leader>gl", "<cmd>BlamerToggle<cr>", { desc = "On/Off Blamer" })

--terminal
map("n", "<leader>'", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { desc = "Toggle Terminal" })

--greeter
-- map("n", "<leader><space>", "<cmd>Alpha<CR>", { desc = "Alpha greeter", remap = true })

--取消默认的一些
map({ "i", "n" }, "<esc>", "<esc>", { desc = "Escape and clear hlsearch", remap = true })
map({ "i", "v", "n" }, "<A-j>", "j", { desc = "Move down", remap = true })  --会和Esc有冲突
map({ "i", "v", "n" }, "<A-k>", "k", { desc = "Move up", remap = true })
