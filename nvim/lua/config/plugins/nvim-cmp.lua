local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
  return
end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
  return
end

local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then
  return
end

-- Tải các snippets giống như trong vs-code từ các plugin (ví dụ: friendly-snippets)
require('luasnip/loaders/from_vscode').lazy_load()

-- Cấu hình các tùy chọn liên quan đến auto-completion
vim.opt.completeopt = 'menu,menuone,noselect'

-- Cấu hình nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(), -- đề xuất trước đó
    ['<C-j>'] = cmp.mapping.select_next_item(), -- đề xuất tiếp theo
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(), -- hiển thị đề xuất hoàn thành
    ['<C-e>'] = cmp.mapping.abort(), -- đóng cửa sổ hoàn thành
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  -- Các nguồn dữ liệu cho auto-completion
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- lsp
    { name = 'luasnip' }, -- snippets
    { name = 'buffer' }, -- văn bản trong bộ đệm hiện tại
    { name = 'path' }, -- đường dẫn trong hệ thống tệp
  }),
  -- Cấu hình lspkind cho biểu tượng giống như trong vs-code
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = '...',
    }),
  },
})

