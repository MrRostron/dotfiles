return {
    -- LSP completion source
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    
    -- Additional completion sources
    {
        "hrsh7th/cmp-buffer", -- buffer words
    },
    {
        "hrsh7th/cmp-path",   -- file paths
    },
    {
        "hrsh7th/cmp-cmdline", -- command line
    },
    
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    
    -- AI Code Completion (Codeium) - FIXED VERSION
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                virtual_text = {
                    enabled = true,
                },
                enable_chat = true,
            })
        end,
    },
    
    -- Main completion engine
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            
            -- Get LSP capabilities
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            -- Load snippets
            require("luasnip.loaders.from_vscode").lazy_load()
            
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    -- TAB: Codeium → cmp → luasnip → normal tab
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        -- Check if Codeium has a suggestion - FIXED API CALL
                        local codeium = require("codeium")
                        if codeium and codeium.get_suggestion and codeium.has_suggestion() then
                            codeium.accept_suggestion()
                        -- Otherwise check if cmp menu is visible
                        elseif cmp.visible() then
                            cmp.select_next_item()
                        -- Otherwise check if we're in a snippet
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        -- Otherwise normal tab
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    
                    -- S-TAB: Previous item or previous snippet jump
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    
                    -- Scroll docs
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    
                    -- Manual completion trigger
                    ["<C-Space>"] = cmp.mapping.complete(),
                    
                    -- Abort completion
                    ["<C-e>"] = cmp.mapping.abort(),
                    
                    -- Confirm selection
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },      -- LSP completions
                    { name = "luasnip" },        -- Snippets
                    { name = "buffer" },         -- Buffer words
                    { name = "path" },           -- File paths
                    { name = "codeium" },        -- AI completions
                }),
                
                -- Enable experimental features
                experimental = {
                    ghost_text = true,  -- Show inline suggestions
                },
            })
            
            -- Store capabilities to use in LSP configs
            _G.cmp_capabilities = capabilities
        end,
    },
}
