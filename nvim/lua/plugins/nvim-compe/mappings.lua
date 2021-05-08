local map = require("utils").map

map("i", "<cr>", 'compe#confirm("<cr>")', { noremap = true, silent = true, expr = true })
map("i", "<c-space>", "compe#complete()", { noremap = true, silent = true, expr = true })
