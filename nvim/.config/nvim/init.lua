-- Basic Neovim settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
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
vim.o.colorcolumn = "140"
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
          ensure_installed = {
            'markdown', 'bash', 'html', 'css',
            'clojure', 'java', 'python', 'lua',
            'c_sharp', 'javascript', 'typescript'
          },
          highlight = { enable = true },
        })
      end
    },

    -- Mason with custom registry for Roslyn
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry", -- Custom registry for Roslyn
          },
        })
      end
    },

    -- Roslyn LSP plugin
    {
      "seblyng/roslyn.nvim",
      ft = "cs",
      opts = {
        -- Add any Roslyn-specific configuration here
      }
    },

    -- Completion engine
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
    },

    -- Snippet engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- FZF/Telescope
    "nvim-telescope/telescope.nvim",
    {
      "junegunn/fzf",
      run = "./install --all"
    },

    -- Other plugins
    "clojure-vim/clojure.vim",
    "ellisonleao/gruvbox.nvim",
    "sainnhe/everforest",
    "navarasu/onedark.nvim",
    { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } },
    "Olical/conjure",
    "HiPhish/rainbow-delimiters.nvim",
    "gpanders/nvim-parinfer",
    "haishanh/night-owl.vim",
    "tpope/vim-dispatch",
    "radenling/vim-dispatch-neovim",
    "clojure-vim/vim-jack-in",
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- Configure other LSP servers using new API
vim.lsp.config('*', {
  root_markers = { '.git', '.gitignore' },
})

-- TypeScript/JavaScript
vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

-- Lua
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  }
})

-- Python
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
})

-- HTML
vim.lsp.config('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
})

-- CSS
vim.lsp.config('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
})

-- Enable LSP servers (except Roslyn - handled by plugin)
vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('html')
vim.lsp.enable('cssls')

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<C-q>', function()
      vim.diagnostic.open_float(nil, {
        border = 'rounded',
        source = 'always'
      })
    end, opts)
    vim.keymap.set('v', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Completion setup (same as before)
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Custom Format command
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format { async = true }
end, {})

-- Setup other plugins
require("nvim-treesitter.install").prefer_git = true
require("gitsigns").setup()

-- Ctrl P
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")

-- Colorscheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
