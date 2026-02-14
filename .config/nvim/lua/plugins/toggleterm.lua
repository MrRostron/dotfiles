return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-\>]],
            direction = "horizontal", -- or 'vertical' or 'float'
            persist_size = true,
            close_on_exit = true,
            shell = vim.o.shell,
        })

        -- Additional keymaps
        local opts = { noremap = true, silent = true }

        -- Toggle terminal
        vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm<CR>", opts)

        -- Open terminal in different directions
        vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)
        vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", opts)
        vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)

        -- Terminal navigation (when in terminal mode)
        vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
        vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
        vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
        vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
        vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
    end,
}
