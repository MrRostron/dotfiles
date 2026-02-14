-- Set leader to space
vim.g.mapleader = " "

-- Spacing options
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Number column options.
vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.fillchars = { eob = " " }

-- Set color scheme
vim.cmd([[colorscheme modus_vivendi]])  -- modus_operandi, modus_vivendi
-- Apply Modus Vivendi colors to Neo-Tree
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#2f8aff" }) -- blue
vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#bfbfbf" })
vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#bfbfbf" })
vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#595959" })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#44bc44" })     -- green
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#b0ba00" })  -- yellow
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#ff0055" })   -- red
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#ff6b55" }) -- bright red
vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "#f78fe7" })  -- magenta
vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = "#9f6f00" })     -- yellow
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NeoTreeSignColumn", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#000000", bg = "#000000" })

-- Apply Modus Vivendi colors to Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#000000", bg = "#000000" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#000000", bg = "#000000" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ffffff", bg = "#2f8aff" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#ffffff", bg = "#00a800" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#ffffff", bg = "#f78fe7" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#0031a4", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#b0ba00", bold = true })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#ff0055" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#000000" })

-- Hide toggleterm border
vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = "#000000", bg = "#000000" })
vim.api.nvim_set_hl(0, "ToggleTermBorderFloat", { fg = "#000000", bg = "#000000" })

-- Hard mode, stop myself navigating with arrow keys (use h,j,k,l dumbass)
local hardmode = true
if hardmode then
    -- Show an error message if a disabled key is pressed,
    local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

    -- Disable arrow keys in insert mode.
    vim.api.nvim_set_keymap("i", "<Up>", "<C-o>" .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap("i", "<Down>", "<C-o>" .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap("i", "<Left>", "<C-o>" .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap("i", "<Right>", "<C-o>" .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap("i", "<Del>", "<C-o>" .. msg, { noremap = true, silent = false })

    -- Disable arrow keys in normal mode.
    vim.api.nvim_set_keymap("n", "<Up>", msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<Down>", msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<Left>", msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<Right>", msg, { noremap = true, silent = false })
end
