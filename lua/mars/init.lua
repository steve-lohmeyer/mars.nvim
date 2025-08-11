-- lua/mars/init.lua
local M = {}

-- Mars palette
M.palette = {
	bg = "#000000", -- main_bg
	fg = "#D9AFA7", -- main_fg
	title = "#D9AFA7", -- title
	accent = "#FF6B4A", -- bright orange
	-- accent = "#FFA74A", -- bright orange
	sel_bg = "#4A2C2C", -- selection background
	sel_fg = "#D9AFA7", -- selection text
	inactive = "#7B534E", -- muted text
	border = "#7B534E", -- window borders

	temp_start = "#E07B5F", -- warm light orange
	-- temp_mid = "#C45A3F", -- rusty mid-orange
	temp_mid = "#B1553A", -- rusty mid-orange
	temp_end = "#A0392F", -- deep rust red
}

M.set_highlights = function()
	local p = M.palette
	local set = vim.api.nvim_set_hl
	local ns = 0

	-------------------------------------------------------------------------
	-- Basic UI
	-------------------------------------------------------------------------
	set(ns, "Normal", { fg = p.fg, bg = p.bg })
	set(ns, "NormalFloat", { fg = p.fg, bg = p.bg })
	set(ns, "FloatBorder", { fg = p.border, bg = p.bg })
	set(ns, "LineNr", { fg = p.inactive, bg = p.bg })
	set(ns, "CursorLineNr", { fg = p.accent, bg = p.bg, bold = true })
	set(ns, "VertSplit", { fg = p.border, bg = p.bg })
	set(ns, "Visual", { fg = p.sel_fg, bg = p.sel_bg })
	set(ns, "Title", { fg = p.title, bold = true })
	set(ns, "Search", { fg = p.bg, bg = p.accent })
	set(ns, "IncSearch", { fg = p.bg, bg = p.temp_mid })
	set(ns, "MatchParen", { fg = p.accent, bold = true })
	set(ns, "Pmenu", { fg = p.fg, bg = p.sel_bg })
	set(ns, "PmenuSel", { fg = p.sel_fg, bg = p.accent })

	-------------------------------------------------------------------------
	-- StatusLine
	-------------------------------------------------------------------------
	set(ns, "StatusLine", { fg = p.fg, bg = p.border })
	set(ns, "StatusLineNC", { fg = p.inactive, bg = p.border })

	-------------------------------------------------------------------------
	-- TabLine
	-------------------------------------------------------------------------
	set(ns, "TabLine", { fg = p.inactive, bg = p.bg }) -- inactive tabs, muted fg on bg
	set(ns, "TabLineSel", { fg = p.fg, bg = p.accent, bold = true }) -- active tab, bright fg on accent bg
	set(ns, "TabLineFill", { fg = p.inactive, bg = p.bg }) -- empty tabline area, muted fg on bg

	-------------------------------------------------------------------------
	-- Diagnostics
	-------------------------------------------------------------------------
	set(ns, "DiagnosticError", { fg = p.temp_end })
	set(ns, "DiagnosticWarn", { fg = p.temp_mid })
	set(ns, "DiagnosticInfo", { fg = p.accent })
	set(ns, "DiagnosticHint", { fg = p.title })

	-------------------------------------------------------------------------
	-- Legacy Vim syntax groups
	-------------------------------------------------------------------------
	set(ns, "Comment", { fg = p.inactive, italic = true })
	set(ns, "Constant", { fg = p.temp_start })
	set(ns, "String", { fg = p.temp_mid })
	set(ns, "Character", { fg = p.temp_mid })
	set(ns, "Number", { fg = p.temp_end })
	set(ns, "Boolean", { fg = p.temp_end })
	set(ns, "Identifier", { fg = p.accent })
	set(ns, "Function", { fg = p.accent, bold = true })
	set(ns, "Statement", { fg = p.temp_start })
	set(ns, "Operator", { fg = p.fg })
	set(ns, "Keyword", { fg = p.temp_end, bold = true })
	set(ns, "Type", { fg = p.temp_mid })
	set(ns, "Special", { fg = p.accent })
	set(ns, "Underlined", { fg = p.accent, underline = true })

	-------------------------------------------------------------------------
	-- Treesitter highlights
	-------------------------------------------------------------------------
	set(ns, "@comment", { link = "Comment" })
	set(ns, "@punctuation", { fg = p.inactive })

	-- JSON & structured data differentiation
	set(ns, "@property", { fg = p.accent }) -- JSON keys
	set(ns, "@string", { fg = p.temp_mid }) -- string values
	set(ns, "@number", { fg = p.temp_end }) -- numeric values
	set(ns, "@boolean", { fg = p.temp_end })
	set(ns, "@null", { fg = p.inactive, italic = true })

	-- Code
	set(ns, "@function", { fg = p.accent, bold = true })
	set(ns, "@function.builtin", { fg = p.temp_start })
	set(ns, "@variable", { fg = p.fg })
	set(ns, "@variable.builtin", { fg = p.temp_end })
	set(ns, "@keyword", { fg = p.temp_end, bold = true })
	set(ns, "@type", { fg = p.temp_mid })
	set(ns, "@type.builtin", { fg = p.temp_start })

	-------------------------------------------------------------------------
	-- LSP Semantic Tokens
	-------------------------------------------------------------------------
	set(ns, "@lsp.type.property", { link = "@property" })
	set(ns, "@lsp.type.parameter", { fg = p.temp_start })
	set(ns, "@lsp.type.variable", { fg = p.fg })
	set(ns, "@lsp.type.function", { link = "@function" })
	set(ns, "@lsp.type.class", { fg = p.temp_mid, bold = true })
	set(ns, "@lsp.type.interface", { fg = p.temp_start, bold = true })
	set(ns, "@lsp.type.enum", { fg = p.temp_start })
	set(ns, "@lsp.type.keyword", { link = "@keyword" })

	-------------------------------------------------------------------------
	-- Neo-tree colors
	-------------------------------------------------------------------------
	set(ns, "NeoTreeNormal", { fg = p.fg, bg = p.bg })
	set(ns, "NeoTreeNormalNC", { fg = p.fg, bg = p.bg })
	set(ns, "NeoTreeDirectoryName", { fg = p.accent, bold = true })
	set(ns, "NeoTreeDirectoryIcon", { fg = p.accent })
	set(ns, "NeoTreeRootName", { fg = p.accent, bold = true })
	set(ns, "NeoTreeFileName", { fg = p.fg })
	set(ns, "NeoTreeFileNameOpened", { fg = p.temp_start })
	set(ns, "NeoTreeSymbolicLinkTarget", { fg = p.temp_mid, italic = true })
	set(ns, "NeoTreeGitAdded", { fg = "#73C991" }) -- we can Mars-ify this later
	set(ns, "NeoTreeGitDeleted", { fg = p.temp_end })
	set(ns, "NeoTreeGitModified", { fg = p.temp_start })
	set(ns, "NeoTreeIndentMarker", { fg = p.border })
	set(ns, "NeoTreeExpander", { fg = p.inactive })
	set(ns, "NeoTreeCursorLine", { bg = p.sel_bg })

	---------------------------------------------------------------------
	-- PLUGIN HIGHLIGHTS
	---------------------------------------------------------------------

	-- Neo-tree
	set(ns, "NeoTreeNormal", { fg = p.fg, bg = p.bg })
	set(ns, "NeoTreeNormalNC", { fg = p.fg, bg = p.bg })
	set(ns, "NeoTreeDirectoryName", { fg = p.accent, bold = true })
	set(ns, "NeoTreeDirectoryIcon", { fg = p.accent })
	set(ns, "NeoTreeRootName", { fg = p.accent, bold = true })
	set(ns, "NeoTreeFileName", { fg = p.fg })
	set(ns, "NeoTreeFileNameOpened", { fg = p.temp_start })
	set(ns, "NeoTreeSymbolicLinkTarget", { fg = p.temp_mid, italic = true })
	set(ns, "NeoTreeGitAdded", { fg = "#8FB573" }) -- Mars greenish
	set(ns, "NeoTreeGitDeleted", { fg = p.temp_end })
	set(ns, "NeoTreeGitModified", { fg = p.temp_start })
	set(ns, "NeoTreeIndentMarker", { fg = p.border })
	set(ns, "NeoTreeExpander", { fg = p.inactive })
	set(ns, "NeoTreeCursorLine", { bg = p.sel_bg })

	-- Telescope
	set(ns, "TelescopeNormal", { fg = p.fg, bg = p.bg })
	set(ns, "TelescopeBorder", { fg = p.border, bg = p.bg })
	set(ns, "TelescopePromptBorder", { fg = p.accent, bg = p.bg })
	set(ns, "TelescopePromptTitle", { fg = p.bg, bg = p.accent, bold = true })
	set(ns, "TelescopePreviewTitle", { fg = p.bg, bg = p.temp_start, bold = true })
	set(ns, "TelescopeResultsTitle", { fg = p.bg, bg = p.border, bold = true })
	set(ns, "TelescopeSelection", { bg = p.sel_bg, fg = p.sel_fg })

	-- GitSigns
	set(ns, "GitSignsAdd", { fg = "#8FB573" })
	set(ns, "GitSignsChange", { fg = p.temp_start })
	set(ns, "GitSignsDelete", { fg = p.temp_end })

	-- Lualine
	set(ns, "StatusLine", { fg = p.fg, bg = p.border })
	set(ns, "StatusLineNC", { fg = p.inactive, bg = p.border })

	-- Which-key
	set(ns, "WhichKey", { fg = p.accent, bold = true })
	set(ns, "WhichKeyGroup", { fg = p.temp_start })
	set(ns, "WhichKeyDesc", { fg = p.fg })
	set(ns, "WhichKeySeparator", { fg = p.border })
	set(ns, "WhichKeyValue", { fg = p.temp_mid })

	-- Cmp (completion)
	set(ns, "CmpItemAbbr", { fg = p.fg })
	set(ns, "CmpItemAbbrDeprecated", { fg = p.inactive, strikethrough = true })
	set(ns, "CmpItemAbbrMatch", { fg = p.accent, bold = true })
	set(ns, "CmpItemKind", { fg = p.temp_start })
	set(ns, "CmpItemMenu", { fg = p.inactive })

	-- Indent-blankline
	set(ns, "IndentBlanklineChar", { fg = p.border })
	set(ns, "IndentBlanklineContextChar", { fg = p.temp_start })

	-- Hop
	set(ns, "HopNextKey", { fg = p.accent, bold = true })
	set(ns, "HopNextKey1", { fg = p.temp_start, bold = true })
	set(ns, "HopNextKey2", { fg = p.temp_mid })
	set(ns, "HopUnmatched", { fg = p.inactive })

	-- Trouble
	set(ns, "TroubleNormal", { fg = p.fg, bg = p.bg })
	set(ns, "TroubleText", { fg = p.fg })
	set(ns, "TroubleCount", { fg = p.accent, bold = true })
	set(ns, "TroubleFile", { fg = p.temp_start })
	set(ns, "TroubleFoldIcon", { fg = p.inactive })

	-- Notify
	set(ns, "NotifyINFOBorder", { fg = p.temp_start })
	set(ns, "NotifyINFOTitle", { fg = p.temp_start, bold = true })
	set(ns, "NotifyINFOIcon", { fg = p.temp_start })
	set(ns, "NotifyWARNBorder", { fg = p.temp_mid })
	set(ns, "NotifyWARNTitle", { fg = p.temp_mid, bold = true })
	set(ns, "NotifyWARNIcon", { fg = p.temp_mid })
	set(ns, "NotifyERRORBorder", { fg = p.temp_end })
	set(ns, "NotifyERRORTitle", { fg = p.temp_end, bold = true })
	set(ns, "NotifyERRORIcon", { fg = p.temp_end })

	-- Noice
	set(ns, "NoiceCmdline", { fg = p.accent, bg = p.bg })
	set(ns, "NoicePopup", { fg = p.fg, bg = p.bg })
	set(ns, "NoiceConfirm", { fg = p.accent, bg = p.bg })
end

return M
