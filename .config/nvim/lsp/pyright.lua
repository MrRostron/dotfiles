-- Get capabilities from nvim-cmp
local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    _G.cmp_capabilities or {}
)

return {
    cmd = { "pyright-langserver", "--stdio" }, -- Command to start the language server
    filetypes = { "python" }, -- File types that this server will handle
    capabilities = capabilities, -- ← ADD THIS LINE (you were missing it!)
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    }, -- Markers to identify the root of the project
    settings = { -- Settings for the language server
        python = { -- IMPORTANT: This is at the root level, not inside pyright
            pythonPath = ".venv/bin/python", -- FIXED: Should point to the binary, not the directory
            venvPath = ".",
            venv = ".venv",
        },
        pyright = {
            -- Auto-import settings
            autoImportCompletions = true,
            autoSearchPaths = true,

            -- Analysis settings
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace", -- or "openFilesOnly"
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic", -- "off", "basic", "strict"
                venvPath = ".", -- Look in the current directory
                venv = ".venv", -- Standard name for virtual environment

                -- Analysis settings that can be toggled
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = "warning",
                    reportUnusedImport = "warning",
                    reportUnusedClass = "warning",
                    reportUnusedFunction = "warning",
                    reportUnusedCoroutine = "warning",
                    reportDuplicateImport = "warning",
                    reportOptionalMemberAccess = "none",
                    reportOptionalSubscript = "none",
                    reportOptionalIterable = "none",
                    reportOptionalContextManager = "none",
                    reportOptionalOperand = "none",
                },

                -- Analysis features
                reportMissingImports = false,
                reportMissingTypeStubs = false, -- Set to true if you use type stubs
                reportUnusedCallResult = "none",
                reportPrivateImportUsage = "warning",

                -- Python version compatibility
                pythonVersion = "3.13", -- Adjust based on your project
            },

            -- Completion settings
            completion = {
                completeFunctionParens = true, -- Don't auto-add parentheses
            },

            -- Indexing settings (for larger projects)
            indexing = true,

            -- Organize imports
            organizeImports = true,
        },
    }, -- ← THIS WAS MISSING! Closes the settings table
    single_file_support = true, -- ← ADD THIS LINE (optional but recommended)
} -- ← THIS WAS MISSING! Closes the return table
