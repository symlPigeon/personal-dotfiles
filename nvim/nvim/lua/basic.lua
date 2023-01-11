-- utf-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮当前行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线
vim.wo.colorcolumn = "80"
-- 缩进，4空格
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.bo.tabstop = 4
vim.o.shiftround = true
-- << >> 移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新的行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索时忽略大小写，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不高亮
vim.o.hlsearch = false
-- 一边输入一边搜索
vim.o.incsearch = true
-- 命令行高度为2
vim.o.cmdheight = 1
-- 文件被外部修改时自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首位时用left/right键移动到上/下一行
vim.o.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
-- 禁止创建交换文件
vim.o.swapfile = false
-- smaller update time
vim.o.updatetime = 300
-- 等待键盘快捷键连击时间
vim.o.timeoutlen = 500
-- spilt window从下面和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全但是不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 显示不可见字符
vim.o.list = true
vim.o.listchars = "space:·"
-- 增强补全
vim.o.wildmenu = true
-- 不向ins-completin menu传递消息
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 最多显示十行补全
vim.o.pumheight = 10
-- 始终显示tab line
vim.showtabline = 2
-- 使用增强状态栏插件之后不需要vim的模式提示
vim.o.showmode = false
-- set system clipboard
vim.api.nvim_set_option('clipboard', 'unnamed')
-- hidden tilde
vim.wo.fillchars = "eob: "
