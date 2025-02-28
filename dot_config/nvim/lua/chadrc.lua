-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",
  transparency = true,
	hl_override = {
		Comment = { italic = true },
 	  ["@comment"] = { italic = true },
	},
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
  cmp = {
    lspkind_text = true,
    style = "flat_dark",
    format_colors = {
      tailwind = false,
    }
  },
}

M.lsp = {
  signature = true,
}

M.cheatsheet = {
  theme = "grid",
  excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
}

return M
