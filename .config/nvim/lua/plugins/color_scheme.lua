return {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function()
        require("modus-themes").setup({
            style = "auto",
            variant = "default",
            transparent = false,
            dim_inactive = false,
            hide_inactive_status_line = false,
            line_nr_column_background = false,
            sign_column_background = false,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = { italic = true },
                variables = {},
            },
        })
    end,
}
