local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  completion = { completeopt = 'menu,menuone,noinsert' },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    -- ["<CR>"] = cmp.config.disable,
    ['<ESC>'] = cmp.mapping.abort(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm { select = false },
    ['<Tab>'] = cmp.mapping(function()
      if cmp.visible() and has_words_before() then
        cmp.confirm { select = true }
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      -- elseif has_words_before() then
      else
        cmp.complete() -- 出现补全
      end
    end, { 'i', 's' }),
  },
  -- cmp.config.sources(
  sources = {
    { name = 'copilot', group_index = 2 }, -- Other Sources
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'path', group_index = 2 },
    { name = 'luasnip', group_index = 2 },
    --  {name = "nvim_lsp"}, {name = "luasnip"},
    --  {name = "path"}
  },
  { { name = 'buffer' } }, -- )
  sorting = {
    priority_weight = 2,
    comparators = {
      require('copilot_cmp.comparators').prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}
-- sources = {
--     -- Copilot Source
--     { name = "copilot", group_index = 2 },
--     -- Other Sources
--     { name = "nvim_lsp", group_index = 2 },
--     { name = "path", group_index = 2 },
--     { name = "luasnip", group_index = 2 },
--   },
