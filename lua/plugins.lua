local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- using packer.nvim
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use("ryanoasis/vim-devicons")
	use("nvim-tree/nvim-web-devicons")

	-- auto-sessino
	use("rmagatti/auto-session")

	-- Comment
	use("numToStr/Comment.nvim")

	use("windwp/nvim-autopairs")

	-- prettier
	use({
		"prettier/vim-prettier",
		run = "yarn install",
		ft = { "javascript", "typescript", "css", "less", "scss", "graphql", "markdown", "vue", "html" },
	})

	-- completions (cmp plugins)
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions

	-- colorschemes
	use("joshdick/onedark.vim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Markdown preview
	--[[ use "ellisonleao/glow.nvim" ]]

	-- gitsigns
	use("lewis6991/gitsigns.nvim")

	-- parantheses and surrounds
	use("p00f/nvim-ts-rainbow")

	-- trim whitespace
	use("cappyzawa/trim.nvim")
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
