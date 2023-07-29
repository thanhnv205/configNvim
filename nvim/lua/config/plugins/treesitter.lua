local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- Cấu hình treesitter
treesitter.setup({
	-- kích hoạt tô sáng cú pháp
	highlight = {
		enable = true,
	},

	indent = { enable = true },
	-- kích hoạt tự động thêm cặp thẻ
	autotag = { enable = true },

	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
	},

	auto_install = true,
})
