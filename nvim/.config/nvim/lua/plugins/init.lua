require("packer").startup(function()
	use { "wbthomason/packer.nvim" }

	-- Better syntax highlighting.
	use { "nvim-treesitter/nvim-treesitter" }

	-- LSP & Autocompletion support.
	use { "neovim/nvim-lspconfig" }
	use { "nvim-lua/lsp_extensions.nvim" }
	use {
		"hrsh7th/nvim-compe",
		requires = { "hrsh7th/vim-vsnip" }
	}
	-- FZF integration.
	use {
		"junegunn/fzf.vim",
		requires = { "junegunn/fzf" }
	}
	use {
		"ojroques/nvim-lspfuzzy",
		requires = {
			{ "junegunn/fzf" },
			{ "junegunn/fzf.vim" }
		}
	}
    use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
		config = function()
			require("plugins.telescope.settings")
			require("plugins.telescope.mappings")
		end
	}

  -- QOL
	use { "mbbill/undotree" }
	use { "b3nj5m1n/kommentary" }
	use { "numtostr/FTerm.nvim" }
	use { "karb94/neoscroll.nvim" }
	use { "tpope/vim-fugitive" }
	use { "tpope/vim-dispatch" }
	use { "editorconfig/editorconfig-vim" }
	use { "ii14/exrc.vim" }
	use {
		"folke/lsp-trouble.nvim",
		config = function()
			require("plugins.lsp-trouble.settings")
			require("plugins.lsp-trouble.mappings")
		end
	}

  -- Interface
	use {
		"mhinz/vim-startify",
		requires = { "ryanoasis/vim-devicons", opt = true }
	}
	use {
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" }
	}
	use {
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}
	use { "vim-airline/vim-airline" }

  -- Color Schemes
	use { "morhetz/gruvbox" }
end)

require "plugins.netrw.settings"
require "plugins.treesitter.settings"
require "plugins.lsp.settings"
require "plugins.lsp.servers.ccls"
require "plugins.lsp.servers.pyright"
require "plugins.lsp.servers.rust_analyzer"
require "plugins.lsp.servers.tsserver"
require "plugins.nvim-compe.settings"
require "plugins.nvim-lspfuzzy.settings"
require "plugins.kommentary.settings"
require "plugins.neoscroll.settings"
require "plugins.startify.settings"
require "plugins.gitsigns.settings"
require "plugins.fterm.settings"
require "plugins.nvim-tree.settings"

require "plugins.lsp.mappings"
require "plugins.nvim-compe.mappings"
-- require "plugins.fzf.mappings"
require "plugins.nvim-lspfuzzy.mappings"
require "plugins.gitsigns.mappings"
require "plugins.fterm.mappings"
require "plugins.nvim-tree.mappings"
require "plugins.kommentary.mappings"
