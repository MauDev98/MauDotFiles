vim.opt.listchars = {
	space = "⋅",
	eol = "↴",
}

require("indent_blankline").setup({
	show_end_of_line = true,
	space_char_blankline = " ",
})

-- NVIM LSP AUTO INSTALLER
local function setup_servers()
	require("lspinstall").setup()
	local servers = require("lspinstall").installed_servers()
	for _, server in pairs(servers) do
		require("lspconfig")[server].setup({})
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

--Enable (broadcasting) snippet capability for completion
-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- })
--
-- local cmp = require("cmp")
--
-- local lspkind = require("lspkind")
--
-- local source_mapping = {
-- 	buffer = "[Buffer]",
-- 	nvim_lsp = "[LSP]",
-- 	nvim_lua = "[Lua]",
-- 	cmp_tabnine = "[TN]",
-- 	path = "[Path]",
-- }
--
-- cmp.setup({
-- 	completion = {
-- 		completeopt = "menu,menuone,noinsert",
-- 	},
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
-- 		end,
-- 	},
-- 	sources = {
-- 		{ name = "cmp_tabnine" },
-- 		{ name = "nvim_lsp" },
-- 		{ name = "buffer" },
-- 		{ name = "path" },
-- 		{ name = "ultisnips" },
-- 	},
-- 	formatting = {
-- 		format = function(entry, vim_item)
-- 			vim_item.kind = lspkind.presets.default[vim_item.kind]
-- 			local menu = source_mapping[entry.source.name]
-- 			if entry.source.name == "cmp_tabnine" then
-- 				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
-- 					menu = entry.completion_item.data.detail .. " " .. menu
-- 				end
-- 				vim_item.kind = ""
-- 			end
-- 			vim_item.menu = menu
-- 			return vim_item
-- 		end,
-- 	},
-- 	mapping = {
-- 		["<M-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
-- 		["<M-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
-- 		["<CR>"] = cmp.mapping.confirm(),
-- 	},
-- })
--
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
	-- capabilities = capabilities,
	capabilities = capabilities,
})

require("lspconfig").html.setup({
	-- capabilities = capabilities,
	capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})

require("lspconfig").pyright.setup({
	capabilities = capabilities,
})

-- TREESITTER NORG
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}

-- NEOVIM TREESITTER
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = { "html" },
	},
	rainbow = {
		enable = true,
		-- extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		-- max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
	},
	ensure_installed = { "norg" },
})

-- NVIM ICONS
require("nvim-web-devicons").setup({
	-- your personnal icons can go here (to override)
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			name = "Zsh",
		},
	},
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
})

-- NVIM BUFFERLINE
require("bufferline").setup({
	options = {
		separator_style = "thick",
		diagnostics = "nvim_lsp",
	},
})

-- LSP DIAGNOSTICS
require("trouble").setup({})
