local map = require("utils").map

map("n", "<c-t>", "<cmd>lua require('FTerm').toggle()<cr>", { noremap = true })
map("t", "<c-t>", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<cr>", { noremap = true })
