local user_command = vim.api.nvim_create_user_command

user_command("UTF", function(opts)
	vim.cmd("e ++enc=utf-8")
end, {})

user_command("CP932", function(opts)
	vim.cmd("e ++enc=cp932")
end, {})
