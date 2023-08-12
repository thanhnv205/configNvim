local status, lualine = pcall(require, 'lualine')
if not status then
  return
end

-- Lấy theme nightfly của lualine
local lualine_nightfly = require('lualine.themes.nightfly')

-- Màu sắc mới cho theme
local colors = {
  blue = '#65D1FF',
  green = '#3EFFDC',
  violet = '#FF61EF',
  yellow = '#FFDA7B',
  black = '#000000',
}

-- Thay đổi màu sắc cho theme nightfly
lualine_nightfly.normal.a.bg = colors.blue
lualine_nightfly.insert.a.bg = colors.green
lualine_nightfly.visual.a.bg = colors.violet
lualine_nightfly.command = {
  a = {
    gui = 'bold',
    bg = colors.yellow,
    fg = colors.black, -- black
  },
}

-- Cấu hình lualine với theme đã chỉnh sửa
lualine.setup({
  options = {
    theme = lualine_nightfly,
  },
})

