local map = require("utils").map
local options = { noremap = true, silent = true }

map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>zz", options)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>zz", options)
map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", options)
map("n", "J", "<cmd>lua vim.lsp.buf.hover()<cr>", options)
map("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<cr>", options)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", options)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", options)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", options)
map("n", "<leader>sr", "<cmd>lua vim.lsp.buf.references()<cr>", options)
map("n", "<leader>ss", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", options)

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t"<C-n>" or t"<Tab>"
end

-- Use <Tab> and <S-Tab> to navigate through popup menu
map("i", "<Tab>", "v:lua.smart_tab()", { noremap = true, silent = true, expr = true })
