-- This is the single file setup taken from lazy
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." }, },
			true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.number = true
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.incsearch = true
vim.o.foldmethod = "manual"
vim.o.showmode = false
vim.o.mouse = "a"
vim.o.autoread = true
vim.o.list = true
vim.o.listchars = "tab:│ ,trail:¤"
vim.o.colorcolumn = "120"
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

-- From CoC recommendations
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

vim.keymap.set("n", "<leader>", "<nop>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
--vim.keymap.set("n", "<leader>p", "<cmd>Telescope lsp_document_symbols<CR>")
--vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_current_linewise)")

--vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
--vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
--vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
--vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
--vim.keymap.set("n", "<C-q>", "<cmd>lua vim.lsp.buf.hover()<CR>")
--vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")
--vim.keymap.set("n", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>")

--vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--- CoC stuff ---
local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

keyset("i", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Use to show documentation in preview window
function _G.show_docs()
	local cw = vim.fn.expand('<cword>')
	if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command('h ' .. cw)
	elseif vim.api.nvim_eval('coc#rpc#ready()') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
	end
end

keyset("n", "<C-q>", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

--- Setup lazy.nvim ---
require("lazy").setup({
	spec = {
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			-- Add languages to be installed here that you want installed for treesitter
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = {
						'markdown', 'bash', 'html', 'css',
						'clojure', 'java', 'python', 'lua'
					},
				})
			end
		},
		"clojure-vim/clojure.vim",
		"nvim-telescope/telescope.nvim",
		"ellisonleao/gruvbox.nvim",
		{ "neoclide/coc.nvim",       branch = "release" },
		"sainnhe/everforest",
		"navarasu/onedark.nvim",
		{ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } },
		"Olical/conjure",
		"HiPhish/rainbow-delimiters.nvim",
		"gpanders/nvim-parinfer",
		-- The following were recommended plugins that I'm not sure I need.
		--"tpope/vim-surround",
		--"guns/vim-sexp",
		--"tpope/vim-sexp-mappings-for-regular-people",
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

require("nvim-treesitter.install").prefer_git = true

require("gitsigns").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
})


vim.o.background = "dark"
vim.cmd([[colorscheme onedark]])

