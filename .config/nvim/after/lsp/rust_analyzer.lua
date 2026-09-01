--@type vim.lsp.Config
return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json", ".git" },
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				disabled = { "unused_imports", "unresolved-import" },
			},
			cargo = {
				extraEnv = {
					RUSTFLAGS = "-A unused_imports",
				},
			},
			checkOnSave = true,
			check = {
				extraEnv = {
					RUSTFLAGS = "-A unused_imports",
				},
			},
		},
	},
	handlers = {
		["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
			if result and result.diagnostics then
				local filtered = {}
				for _, d in ipairs(result.diagnostics) do
					if d.code ~= "unused_imports" and not (d.message and d.message:match("unused import")) then
						table.insert(filtered, d)
					end
				end
				result.diagnostics = filtered
			end
			vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
		end,
	},
}
