local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, 'telescope.actions')
if not actions_setup then
  return
end

-- Cấu hình telescope
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous, -- di chuyển đến kết quả trước đó
        ['<C-j>'] = actions.move_selection_next, -- di chuyển đến kết quả tiếp theo
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- gửi các kết quả đã chọn vào quickfixlist
      },
    },
  },
})

-- Tải extension "fzf" cho telescope
telescope.load_extension('fzf')

