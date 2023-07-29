local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Đặt keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- hiển thị định nghĩa, tham chiếu
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- di chuyển đến định nghĩa
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- xem định nghĩa và thay đổi trong cửa sổ
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- di chuyển đến implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- xem các code actions có sẵn
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- hiển thị thông báo lỗi cho dòng
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- hiển thị thông báo lỗi cho con trỏ
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- chuyển đến thông báo lỗi trước đó trong buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- chuyển đến thông báo lỗi tiếp theo trong buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- hiển thị tài liệu cho cái đang ở dưới con trỏ
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- xem outline bên phải

	-- keymaps đặc biệt cho typescript (ví dụ: rename file và cập nhật imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- đổi tên tệp và cập nhật imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- tổ chức imports (không có trong video nvim)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- xóa biến không sử dụng (không có trong video nvim)
	end
end

-- Dùng để kích hoạt autocompletion (gán cho mỗi cấu hình của lsp server)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- cấu hình server html
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- cấu hình typescript
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- cấu hình css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- cấu hình tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- cấu hình emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- cấu hình lua server
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- các thiết lập tùy chỉnh cho lua
		Lua = {
			-- làm cho language server nhận ra biến toàn cục "vim"
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- làm cho language server nhận biết các tệp runtime
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
