-- auto install packer if not installed
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
  local packer_bootstrap = ensure_packer() -- true if packer was just installed


-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  	use("savq/melange-nvim")
  	use("shaunsingh/solarized.nvim")

	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	
	-- status line / lualine
	use("nvim-lualine/lualine.nvim")

	-- using packer.nvim
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	
	-- vscode like icons
	use("nvim-tree/nvim-web-devicons")

	-- file explorer / nvim-tree
	use("nvim-tree/nvim-tree.lua")

	-- telescope
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Comment
	use("numToStr/Comment.nvim")


	-- completions (cmp plugins)
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("neovim/nvim-lspconfig") -- enable LSP
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
		  { "nvim-tree/nvim-web-devicons" },
		  { "nvim-treesitter/nvim-treesitter" },
		},
	  }) 
	  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	  use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- gitsigns
	use("lewis6991/gitsigns.nvim")

	-- parantheses and surrounds
	use("p00f/nvim-ts-rainbow")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	
	
	if packer_bootstrap then
		require("packer").sync()
	end
end)
