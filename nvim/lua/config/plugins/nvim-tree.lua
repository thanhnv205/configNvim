local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- Cấu hình nvim-tree
nvimtree.setup({
    renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = '', -- mũi tên khi thư mục đã đóng
          arrow_open = '', -- mũi tên khi thư mục đã mở
        },
      },
    },
  },
  -- Tắt window_picker để
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})

-- Mở nvim-tree khi setup

local function open_nvim_tree(data)
  local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- thay đổi đến thư mục
  if directory then
    vim.cmd('cd ' .. data.file)
  end

  -- mở cây
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

