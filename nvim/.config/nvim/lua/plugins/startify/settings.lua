-- local execute = require("utils").execute

vim.g.startify_change_to_dir = 0
vim.g.startify_enable_special = 0

-- -- I broke something and startify's FileType Icons won't show up unless this is enabled?
-- execute([[
-- function! StartifyEntryFormat()
--     return 'WebDevIconsGetFileTypeSymbol(absolute_path) .  " " .  entry_path'
-- endfunction
-- ]])
