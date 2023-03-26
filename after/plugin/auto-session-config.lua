local session_status_ok, session = pcall(require, "auto-session")
if not session_status_ok then
	return
end

local function restore_nvim_tree()
	local nvim_tree = require("nvim-tree")
	nvim_tree.change_dir(vim.fn.getcwd())
	nvim_tree.refresh()
end

session.setup({
	auto_session_enable_last_session = true,
	postrestore_cmds = { "{vim_cmd_1}", restore_nvim_tree, "{vim_cmd_2}" },
	log_level = "info",
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
	auto_session_suppress_dirs = nil,
	auto_session_use_git_branch = nil,
})
