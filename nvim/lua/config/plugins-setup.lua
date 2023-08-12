-- Tự động cài đặt packer nếu chưa được cài đặt
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true nếu packer vừa được cài đặt

-- Auto-command để tải lại Neovim và cài đặt/cập nhật/xóa plugin khi tệp được lưu
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Import packer
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Thêm danh sách các plugin để cài đặt
return packer.startup(function(use)
	-- packer có thể quản lý chính nó
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- theme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- điều hướng tmux & cửa sổ chia
	use("christoomey/vim-tmux-navigator")

	-- Plugin cần thiết
	use("tpope/vim-surround") -- thêm, xóa, thay đổi các phần bao quanh
	use("inkarkat/vim-ReplaceWithRegister")

	--  comment
	use("numToStr/Comment.nvim")

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- Tìm kiếm mờ hóa với telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- Tự động hoàn thành
	use("hrsh7th/nvim-cmp") -- plugin hoàn thành
	use("hrsh7th/cmp-buffer") -- nguồn cho văn bản trong bộ đệm
	use("hrsh7th/cmp-path") -- nguồn cho các đường dẫn hệ thống tệp

	-- Mẫu
	use("L3MON4D3/LuaSnip") -- công cụ mẫu
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Quản lý & cài đặt máy chủ LSP, linter & formatter
	use("williamboman/mason.nvim") -- quản lý máy chủ LSP, linter & formatter
	use("williamboman/mason-lspconfig.nvim") -- cầu nối giữa mason và lspconfig

	-- Cấu hình máy chủ LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- giao diện LSP nâng cao
	use("jose-elias-alvarez/typescript.nvim") -- chức năng bổ sung (update import)
	use("onsails/lspkind.nvim") -- biểu tượng giống như vscode

	-- Định dạng & kiểm tra lỗi
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Cấu hình treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Tự động đóng ngoặc
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- tự động đóng các thẻ

	if packer_bootstrap then
		require("packer").sync()
	end
end)
