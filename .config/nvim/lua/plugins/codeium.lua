return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            -- Enable virtual text suggestions (gray text)
            enable_chat = true,  -- Optional: enable chat feature
            
            -- Fix: virtual_text is a TABLE, not a boolean
            virtual_text = {
                enabled = true,  -- This is the correct way
                -- You can also set styling options:
                -- highlight = "Comment",  -- Highlight group
                -- priority = 4096,       -- Priority for extmarks
            },
        })
    end,
}
