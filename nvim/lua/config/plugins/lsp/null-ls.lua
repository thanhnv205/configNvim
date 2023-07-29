local setup, null_ls = pcall(require, 'null-ls')
if not setup then
  return
end

local formatting = null_ls.builtins.formatting -- để cấu hình formatters
local diagnostics = null_ls.builtins.diagnostics -- để cấu hình linters

-- để cấu hình format khi lưu
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- cấu hình null_ls
null_ls.setup({
  -- cấu hình formatters & linters
  sources = {
    -- để tắt các loại tệp, sử dụng
    -- "formatting.prettier.with({disabled_filetypes = {}})" (xem null-ls docs)
    formatting.prettier, 
    formatting.stylua, -- định dạng lua
    diagnostics.eslint_d.with({ -- trình linter js/ts

      -- chỉ kích hoạt eslint nếu root có .eslintrc.js (không có trong video nvim)
      condition = function(utils)
        return utils.root_has_file('.eslintrc.js') -- thay đổi đuôi tệp nếu bạn sử dụng cái khác
      end,
    }),
  },

  -- cấu hình format khi lưu
  on_attach = function(current_client, bufnr)
    if current_client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              -- chỉ sử dụng null-ls để định dạng thay vì lsp server
              return client.name == 'null-ls'
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})

