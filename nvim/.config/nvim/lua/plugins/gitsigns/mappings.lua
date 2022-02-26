local map = require("utils").map

map("n", "]c", [[&diff ? "]c" : "<cmd>lua require('gitsigns').next_hunk()<cr>"]], { noremap = true, expr = true })
map("n", "[c", [[&diff ? "[c" : "<cmd>lua require('gitsigns').prev_hunk()<cr>"]], { noremap = true, expr = true })

map("n", "<leader>b", "<cmd>lua require('gitsigns').blame_line()<cr>", { noremap = true })

map("n", "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", { noremap = true })
map("n", "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", { noremap = true })
map("n", "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", { noremap = true })
map("n", "<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", { noremap = true })
map("n", "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", { noremap = true })
