local set = require("utils").set
local execute = require("utils").execute

set("tabstop=4")
set("shiftwidth=4")
set("smartindent")
set("number")
set("nowrap")
set("ignorecase")
set("smartcase")
set("noswapfile")
set("undofile")
set("incsearch")
set("foldmethod=indent")
set("nofoldenable")
set("noshowmode")
set("mouse=a")
set("autoread")
set("list")
set("listchars=tab:\\ ,trail:¤")
set("colorcolumn=80");
set("clipboard=unnamedplus")

execute([[
augroup vimrc
  autocmd!
  " Only show the cursor line when in insert mode.
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set nocursorline

  " After yanking a selection, highlight the selection for a bit.
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }
augroup end
]])
