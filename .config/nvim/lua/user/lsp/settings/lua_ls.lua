return {
	lua_ls = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
}