local map = require("utils").map

vim.g.mapleader = " "

map("n", "<leader>h", "<cmd>wincmd h<cr>", { noremap = true })
map("n", "<leader>l", "<cmd>wincmd l<cr>", { noremap = true })
map("n", "<leader>j", "<cmd>wincmd j<cr>", { noremap = true })
map("n", "<leader>k", "<cmd>wincmd k<cr>", { noremap = true })
map("n", "<leader>n", "<cmd>tabnew<cr>", { noremap = true })

map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
