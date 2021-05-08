local kommentary = require("kommentary.config")

kommentary.configure_language("default", { prefer_single_line_comments = true })
vim.g.kommentary_create_default_mappings = false
