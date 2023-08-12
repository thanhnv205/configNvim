local opt = vim.opt --for concisenss

-- Hiển thị số dòng
opt.relativenumber = true -- hiển thị số dòng tương đối
opt.number = true -- hiển thị số dòng tuyệt đối trên dòng con trỏ 

-- Tabs và thụt lề
opt.tabstop = 2 -- 2 khoảng trắng cho một tab (mặc định của prettier)
opt.shiftwidth = 2 -- 2 khoảng trắng cho độ rộng thụt lề
opt.expandtab = true -- thay thế tab bằng dấu cách
opt.autoindent = true -- sao chép thụt lề từ dòng hiện tại khi bắt đầu dòng mới

-- Không xuống dòng tự động
opt.wrap = true -- tắt tự động xuống dòng

-- Cài đặt tìm kiếm
opt.ignorecase = true -- tìm kiếm không phân biệt chữ hoa/thường
opt.smartcase = true -- tìm kiếm trở thành phân biệt chữ hoa/thường

-- Đánh dấu dòng con trỏ
opt.cursorline = true -- tô sáng dòng con trỏ hiện tại

-- Giao diện

opt.termguicolors = true
opt.background = "dark" -- được chọn chế độ màu dark
opt.signcolumn = "yes" -- hiển thị cột đánh dấu để văn bản không dịch chuyển

-- Cài đặt backspace
opt.backspace = "indent,eol,start" -- cho phép backspace hoạt động trên thụt lề, cuối dòng hoặc vị trí bắt đầu chế độ insert

-- Bộ nhớ đệm
opt.clipboard:append("unnamedplus") -- sử dụng clipboard hệ thống làm bộ đệm mặc định

-- Chia cửa sổ
opt.splitright = true -- chia cửa sổ theo hướng dọc bên phải
opt.splitbelow = true -- chia cửa sổ theo hướng ngang ở phía dưới

opt.iskeyword:append("-") -- xem chuỗi-ký tự như một từ nguyên
