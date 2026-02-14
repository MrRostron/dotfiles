return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-tree/nvim-web-devicons", -- Optional but recommended for icons
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")
            -- Telescope setup
            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = "➤ ",
                    path_display = { "truncate" },
                    file_ignore_patterns = {
                        "node_modules",
                        ".git",
                        ".cache",
                        "build",
                        "dist",
                        "target",
                        "%.o",
                        "%.a",
                        "%.so",
                        "%.dll",
                        "%.exe",
                    },
                    -- Enable hidden files by default
                    hidden = true,
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<esc>"] = actions.close,
                        },
                        n = {
                            ["q"] = actions.close,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                    layout_config = {
                        horizontal = {
                            preview_width = 0.6,
                        },
                        width = 0.95,
                        height = 0.95,
                    },
                },
                pickers = {
                    find_files = {
                        theme = "ivy",
                        hidden = true,
                        find_command = {
                            "fd",
                            "--type",
                            "f",
                            "--hidden",
                            "--follow",
                            "--exclude",
                            ".git",
                            "--exclude",
                            "node_modules",
                        },
                    },
                    live_grep = {
                        theme = "ivy",
                        hidden = true,
                        additional_args = function()
                            return { "--hidden" }
                        end,
                    },
                    buffers = {
                        theme = "ivy",
                        previewer = false,
                        mappings = {
                            i = {
                                ["<C-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["<C-d>"] = actions.delete_buffer,
                            },
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_ivy({}),
                    },
                    file_browser = {
                        theme = "ivy",
                        hijack_netrw = true, -- Take over netrw
                        hidden = true, -- Show hidden files in file browser
                        mappings = {
                            i = {},
                            n = {},
                        },
                    },
                },
            })

            -- Load extensions
            telescope.load_extension("ui-select")
            telescope.load_extension("file_browser")
            telescope.load_extension("live_grep_args")

            -- ========== TELESCOPE KEYMAPS ==========

            -- Basic file navigation (all include hidden files)
            vim.keymap.set("n", "<C-p>", function()
                builtin.find_files({ hidden = true })
            end, { desc = "Telescope: Find files (including hidden)" })

            vim.keymap.set("n", "<leader>ff", function()
                builtin.find_files({ hidden = true })
            end, { desc = "Telescope: Find files (including hidden)" })

            vim.keymap.set("n", "<leader>fg", function()
                builtin.live_grep({ additional_args = { "--hidden" } })
            end, { desc = "Telescope: Live grep (including hidden)" })

            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Open buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help tags" })

            -- Git integration
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope: Git commits" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope: Git branches" })
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope: Git status" })

            -- Advanced searching
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope: Recent files" })
            vim.keymap.set("n", "<leader>fR", builtin.resume, { desc = "Telescope: Resume last search" })
            vim.keymap.set("n", "<leader>f/", builtin.search_history, { desc = "Telescope: Search history" })
            vim.keymap.set("n", "<leader>f:", builtin.command_history, { desc = "Telescope: Command history" })

            -- LSP integration
            vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope: LSP references" })
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Telescope: LSP definitions" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Telescope: LSP implementations" })
            vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Telescope: Diagnostics" })
            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Telescope: Document symbols" })
            vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "Telescope: Workspace symbols" })

            -- File browser extension (includes hidden files)
            vim.keymap.set("n", "<leader>fe", function()
                telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = vim.fn.expand("%:p:h"),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = "normal",
                })
            end, { desc = "Telescope: File browser (including hidden)" })

            -- Live grep with args extension (includes hidden files)
            vim.keymap.set("n", "<leader>fG", function()
                telescope.extensions.live_grep_args.live_grep_args({
                    additional_args = { "--hidden" },
                })
            end, { desc = "Telescope: Live grep with args (including hidden)" })

            -- Quickfix list
            vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope: Quickfix list" })
            vim.keymap.set("n", "<leader>fl", builtin.loclist, { desc = "Telescope: Location list" })

            -- Custom: Find files in current file's directory (including hidden)
            vim.keymap.set("n", "<leader>fd", function()
                builtin.find_files({ cwd = vim.fn.expand("%:p:h"), hidden = true })
            end, { desc = "Telescope: Find files in current dir (including hidden)" })

            -- Custom: Grep in current file's directory (including hidden)
            vim.keymap.set("n", "<leader>fD", function()
                builtin.live_grep({ cwd = vim.fn.expand("%:p:h"), additional_args = { "--hidden" } })
            end, { desc = "Telescope: Live grep in current dir (including hidden)" })

            -- Keymaps for quick access (like Harpoon but better)
            vim.keymap.set("n", "<leader>1", function()
                builtin.buffers({ sort_lastused = true })
            end, { desc = "Telescope: Recent buffers" })

            vim.keymap.set("n", "<leader>2", function()
                builtin.oldfiles({ only_cwd = true })
            end, { desc = "Telescope: Recent files in CWD" })

            -- Additional keymaps for different file visibility levels
            vim.keymap.set("n", "<leader>fn", function()
                builtin.find_files({ hidden = false })
            end, { desc = "Telescope: Find files (no hidden)" })

            vim.keymap.set("n", "<leader>fa", function()
                builtin.find_files({ hidden = true, no_ignore = true })
            end, { desc = "Telescope: Find all files (no ignore)" })

            vim.keymap.set("n", "<leader>fgn", function()
                builtin.live_grep({ additional_args = {} }) -- No hidden flag
            end, { desc = "Telescope: Live grep (no hidden)" })
        end,
    },
}
