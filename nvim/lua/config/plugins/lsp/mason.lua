local mason_status, mason = pcall(require, 'mason')
if not mason_status then
  return
end


local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_status then
  return
end

-- Kích hoạt mason
mason.setup()

mason_lspconfig.setup({
  -- Danh sách các server mà mason cần cài đặt
  ensure_installed = {
    'tsserver',
    'html',
    'cssls',
    'tailwindcss',
    'lua_ls',
    'emmet_ls',
  },
  -- Tự động cài đặt các server được cấu hình (với lspconfig)
  automatic_installation = true,
})

mason_null_ls.setup({
  ensure_installed = {
    'prettier', 
    'stylua', -- trình định dạng lua
    'eslint_d', -- trình linter ts/js
  },
  -- Tự động cài đặt các formatters & linters được cấu hình (với null-ls)
  automatic_installation = true,
})

