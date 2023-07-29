-- Đặt leader key thành space
vim.g.mapleader = ' '

local keymap = vim.keymap -- để rút gọn mã

---------------------
-- Phím tắt chung
---------------------

-- Sử dụng jk để thoát khỏi chế độ chèn
keymap.set('i', 'jk', '<ESC>')

-- Xóa một ký tự duy nhất mà không sao chép vào bộ đăng ký
keymap.set('n', 'x', "'_x")

-- Tăng/giảm số
keymap.set('n', '<leader>+', '<C-a>') -- tăng
keymap.set('n', '<leader>-', '<C-x>') -- giảm

-- Quản lý cửa sổ
keymap.set('n', '<leader>sv', '<C-w>v') -- chia cửa sổ theo chiều dọc
keymap.set('n', '<leader>sh', '<C-w>s') -- chia cửa sổ theo chiều ngang
keymap.set('n', '<leader>se', '<C-w>=') -- làm cho các cửa sổ chia đều chiều rộng và chiều cao
keymap.set('n', '<leader>sx', ':close<CR>') -- đóng cửa sổ chia hiện tại

keymap.set('n', '<leader>to', ':tabnew<CR>') -- mở tab mới
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- đóng tab hiện tại
keymap.set('n', '<leader>tn', ':tabn<CR>') -- chuyển đến tab tiếp theo
keymap.set('n', '<leader>tp', ':tabp<CR>') -- chuyển đến tab trước đó

----------------------
-- Phím tắt cho Plugin
----------------------

-- nvim-tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>') -- chuyển đổi trình duyệt tập tin

-- telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- tìm tập tin trong thư mục làm việc hiện tại, tôn trọng .gitignore
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>') -- tìm chuỗi trong thư mục làm việc hiện tại khi bạn gõ
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>') -- tìm chuỗi dưới con trỏ trong thư mục làm việc hiện tại
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- liệt kê các bộ đệm đang mở trong phiên bản neovim hiện tại
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') -- liệt kê các thẻ trợ giúp có sẵn

-- khởi động lại lsp server
keymap.set('n', '<leader>rs', ':LspRestart<CR>') -- phím tắt để khởi động lại lsp nếu cần thiết

