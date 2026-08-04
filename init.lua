local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.opt.number = true         -- numéros de ligne
vim.opt.relativenumber = true -- numéros relatifs (pratique pour naviguer)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.g.mapleader = " "          -- barre d'espace comme touche leader


require("lazy").setup({
  { "folke/tokyonight.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- source LSP
      "hrsh7th/cmp-buffer",     -- complétion depuis le texte ouvert
      "hrsh7th/cmp-path",       -- complétion de chemins de fichiers
      "L3MON4D3/LuaSnip",       -- moteur de snippets
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
})

vim.cmd.colorscheme("tokyonight")



require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "clangd" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('pyright', {
  capabilities = capabilities,
})
vim.lsp.config('clangd', {
  capabilities = capabilities,
})

vim.lsp.enable({ 'pyright', 'clangd' })

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})


local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())



