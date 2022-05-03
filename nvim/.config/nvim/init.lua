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
vim.o.colorcolumn = 80
vim.o.clipboard = "unnamedplus"

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- use 'nvim-lualine/lualine.nvim' -- Fancier statusline
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("ellisonleao/gruvbox.nvim")
end)

require("Comment").setup()

vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>", "<nop>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope<CR>")
vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_current_linewise)")

vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

