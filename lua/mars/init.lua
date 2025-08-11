-- init.lua for Mars theme in Neovim

vim.cmd("set termguicolors") -- Enable true colors

local colors = {
	bg = "#000000", -- Main background
	fg = "#D9AFA7", -- Main text
	selected_bg = "#4A2C2C", -- Selected background
	selected_fg = "#D9AFA7", -- Selected foreground
	inactive_fg = "#7B534E", -- Inactive text
	highlight = "#FF6B4A", -- Highlight
	gradient_start = "#E07B5F",
	gradient_mid = "#C45A3F",
	gradient_end = "#A0392F",
	black = "#4A2C2C",
	red = "#A0392F",
	green = "#E07B5F",
	yellow = "#C45A3F",
	blue = "#7B534E",
	magenta = "#FF6B4A",
	cyan = "#D9AFA7",
	white = "#F9CFC7",
	bright_black = "#5A3C3C",
	bright_red = "#B0493F",
	bright_green = "#F08B6F",
	bright_yellow = "#D46A4F",
	bright_blue = "#8B634E",
	bright_magenta = "#FF8B6A",
	bright_cyan = "#E9BFB7",
	bright_white = "#FFD7CF",
}

-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "mars"

-- Set basic highlights
local hl = vim.api.nvim_set_hl
hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "NormalFloat", { fg = colors.fg, bg = colors.black })
hl(0, "FloatBorder", { fg = colors.blue, bg = colors.black })
hl(0, "Comment", { fg = colors.inactive_fg, italic = true })
hl(0, "Constant", { fg = colors.green })
hl(0, "String", { fg = colors.yellow })
hl(0, "Character", { fg = colors.green })
hl(0, "Number", { fg = colors.red })
hl(0, "Boolean", { fg = colors.red })
hl(0, "Float", { fg = colors.red })
hl(0, "Identifier", { fg = colors.cyan })
hl(0, "Function", { fg = colors.magenta })
hl(0, "Statement", { fg = colors.magenta })
hl(0, "Conditional", { fg = colors.magenta })
hl(0, "Repeat", { fg = colors.magenta })
hl(0, "Label", { fg = colors.magenta })
hl(0, "Operator", { fg = colors.fg })
hl(0, "Keyword", { fg = colors.magenta })
hl(0, "Exception", { fg = colors.magenta })
hl(0, "PreProc", { fg = colors.yellow })
hl(0, "Include", { fg = colors.magenta })
hl(0, "Define", { fg = colors.magenta })
hl(0, "Macro", { fg = colors.magenta })
hl(0, "PreCondit", { fg = colors.yellow })
hl(0, "Type", { fg = colors.green })
hl(0, "StorageClass", { fg = colors.green })
hl(0, "Structure", { fg = colors.green })
hl(0, "Typedef", { fg = colors.green })
hl(0, "Special", { fg = colors.yellow })
hl(0, "SpecialChar", { fg = colors.highlight })
hl(0, "Tag", { fg = colors.highlight })
hl(0, "Delimiter", { fg = colors.fg })
hl(0, "SpecialComment", { fg = colors.inactive_fg })
hl(0, "Debug", { fg = colors.red })
hl(0, "Underlined", { fg = colors.blue, underline = true })
hl(0, "Ignore", { fg = colors.inactive_fg })
hl(0, "Error", { fg = colors.bg, bg = colors.red })
hl(0, "Todo", { fg = colors.bg, bg = colors.yellow })

-- UI elements
hl(0, "LineNr", { fg = colors.inactive_fg })
hl(0, "CursorLineNr", { fg = colors.highlight })
hl(0, "CursorLine", { bg = colors.selected_bg })
hl(0, "StatusLine", { fg = colors.selected_fg, bg = colors.selected_bg })
hl(0, "StatusLineNC", { fg = colors.inactive_fg, bg = colors.black })
hl(0, "VertSplit", { fg = colors.blue })
hl(0, "TabLine", { fg = colors.inactive_fg, bg = colors.bg })
hl(0, "TabLineFill", { bg = colors.bg })
hl(0, "TabLineSel", { fg = colors.fg, bg = colors.selected_bg })
hl(0, "Visual", { bg = colors.selected_bg })
hl(0, "Search", { fg = colors.bg, bg = colors.highlight })
hl(0, "IncSearch", { fg = colors.bg, bg = colors.highlight })
hl(0, "Substitute", { fg = colors.bg, bg = colors.yellow })
hl(0, "Directory", { fg = colors.green })
hl(0, "Title", { fg = colors.fg, bold = true })
hl(0, "ErrorMsg", { fg = colors.red })
hl(0, "WarningMsg", { fg = colors.yellow })
hl(0, "ModeMsg", { fg = colors.green })
hl(0, "MoreMsg", { fg = colors.green })
hl(0, "Question", { fg = colors.magenta })
hl(0, "NonText", { fg = colors.inactive_fg })
hl(0, "SignColumn", { bg = colors.bg })
hl(0, "Folded", { fg = colors.inactive_fg, bg = colors.black })
hl(0, "FoldColumn", { fg = colors.inactive_fg })
hl(0, "Pmenu", { fg = colors.fg, bg = colors.black })
hl(0, "PmenuSel", { fg = colors.selected_fg, bg = colors.selected_bg })
hl(0, "PmenuSbar", { bg = colors.black })
hl(0, "PmenuThumb", { bg = colors.blue })
hl(0, "WildMenu", { fg = colors.bg, bg = colors.highlight })
hl(0, "DiffAdd", { fg = colors.green, bg = colors.bg })
hl(0, "DiffChange", { fg = colors.yellow, bg = colors.bg })
hl(0, "DiffDelete", { fg = colors.red, bg = colors.bg })
hl(0, "DiffText", { fg = colors.fg, bg = colors.selected_bg })

-- Treesitter highlights (if plugin installed)
hl(0, "@variable", { fg = colors.cyan })
hl(0, "@function", { fg = colors.magenta })
hl(0, "@keyword", { fg = colors.magenta })
hl(0, "@string", { fg = colors.yellow })
hl(0, "@number", { fg = colors.red })
hl(0, "@boolean", { fg = colors.red })
hl(0, "@comment", { fg = colors.inactive_fg, italic = true })
hl(0, "@type", { fg = colors.green })
hl(0, "@constant", { fg = colors.green })
hl(0, "@operator", { fg = colors.fg })
hl(0, "@punctuation", { fg = colors.fg })

-- LSP diagnostics
hl(0, "DiagnosticError", { fg = colors.red })
hl(0, "DiagnosticWarn", { fg = colors.yellow })
hl(0, "DiagnosticInfo", { fg = colors.green })
hl(0, "DiagnosticHint", { fg = colors.blue })
