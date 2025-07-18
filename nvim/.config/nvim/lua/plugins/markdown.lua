return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons", -- required for icons
	},
	config = function()
		require("render-markdown").setup({
			render_modes = { "n", "c", "t" },
			anti_conceal = {
				enabled = true,
				ignore = { "RenderMarkdownMath", "check_icon" },
				above = 0,
				below = 0,
			},
			heading = {
				width = "block",
				min_width = 30,
			},
			latex = {
				enabled = true,
				converter = "latex2text",
				highlight = "RenderMarkdownMath",
				position = "above",
				top_pad = 0,
				bottom_pad = 0,
			},
			indent = {
				enabled = true,
				per_level = 2,
				skip_level = 1,
				skip_heading = false,
				icon = "▎",
				highlight = "RenderMarkdownIndent",
			},
			link = {
				enabled = true,
				footnote = { enabled = true, superscript = true, prefix = "", suffix = "" },
				image = "󰥶 ",
				email = "󰀓 ",
				hyperlink = "󰌹 ",
				wiki = {
					icon = "󱗖 ",
					body = function()
						return nil
					end,
					highlight = "RenderMarkdownWikiLink",
				},
				custom = {
					web = { pattern = "^http", icon = "󰖟 " },
					discord = { pattern = "discord%.com", icon = "󰙯 " },
					github = { pattern = "github%.com", icon = "󰊤 " },
					gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
					google = { pattern = "google%.com", icon = "󰊭 " },
					neovim = { pattern = "neovim%.io", icon = " " },
					reddit = { pattern = "reddit%.com", icon = "󰑍 " },
					stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
					wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
					youtube = { pattern = "youtube%.com", icon = "󰗃 " },
				},
				highlight = "RenderMarkdownLink",
			},
			checkbox = { -- fixed nesting per GitHub issue #38
				unchecked = { icon = "✘ " },
				checked = { icon = "✔ " },
				custom = { todo = { rendered = "◯ " } },
				right_pad = 1, -- for spacing alignment
				bullet = true, -- optionally render bullet even with checkbox (#423)
			},
			preset = "none", -- avoid overriding defaults unexpectedly (#3)
			max_file_size = 10.0,
			debounce = 100,
			win_options = {
				conceallevel = { default = vim.o.conceallevel, rendered = 3 },
				concealcursor = { default = vim.o.concealcursor, rendered = "" },
			},
			file_types = { "markdown" },
		})
	end,
}
