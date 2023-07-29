local saga_status, saga = pcall(require, 'lspsaga')
if not saga_status then
  return
end

saga.setup({
  scroll_preview = { scroll_down = '<C-f>', scroll_up = '<C-b>' },
  -- sử dụng phím Enter để mở tệp với xem trước định nghĩa
  definition = {
    edit = '<CR>',
  },
  ui = {
    colors = {
      normal_bg = '#022746',
    },
  },
})

