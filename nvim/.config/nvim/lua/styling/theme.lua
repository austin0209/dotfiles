local has = require("utils").has
local set = require("utils").set

if has("termguicolors") then
  set("termguicolors")
end

vim.api.nvim_command("colorscheme gruvbox");
