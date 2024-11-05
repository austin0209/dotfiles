-- This is the single file setup taken from lazy
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." }, }, true, {})
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
vim.o.colorcolumn = "80"
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

vim.keymap.set("n", "<leader>", "<nop>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>p", "<cmd>Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_current_linewise)")

vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<C-q>", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
      {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      -- Add languages to be installed here that you want installed for treesitter
      config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = {
            'markdown', 'bash', 'html', 'css',
            'clojure', 'java', 'python','lua'
          },
        })
      end
    },
    "clojure-vim/clojure.vim",
    "nvim-telescope/telescope.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"ellisonleao/gruvbox.nvim"
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
})


vim.cmd([[colorscheme gruvbox]])

