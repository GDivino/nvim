local autopairs = require("nvim-autopairs")

autopairs.setup({
    fast_wrap = {
        chars = {
            "{",
            "[",
            "***",
            "(",
            '"',
            "'",
            "`"
        },
        map = "<A-w>",
        end_key = "l",
        after_key = "j"
    }
})
