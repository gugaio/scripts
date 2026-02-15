-- Set options
vim.opt.number = true

-- Inicia o Mason primeiro (ele ainda é necessário para gerenciar os binários)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "pyright", "clangd" }
})

-- Novo padrão Neovim 0.11+ 
-- Em vez de require('lspconfig').servidor.setup, usamos:
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Ativar os servidores especificamente
vim.lsp.enable('ts_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Ou use '■', '▎', 'x'
    source = "always", -- Mostra se o erro vem do TypeScript, Linter, etc.
  },
  float = {
    border = "rounded",
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- Não fica gritando erro enquanto você ainda está digitando
  severity_sort = true,
})

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter confirma a sugestão
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- Sugestões do TypeScript/LSP
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Load linting configuration
--require('lint-config')