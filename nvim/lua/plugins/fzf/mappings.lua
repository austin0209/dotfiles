local map = require("utils").map

map("n", "<C-p>", ":Files<CR>", { noremap = true, silent = true })
map("n", "<leader>p", ":GFiles<CR>", { noremap = true, silent = true })
