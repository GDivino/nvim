return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
    workspace = {
        library = {
            "~/.config/nvim/",
            vim.env.VIMRUNTIME
        }
    },
    settings = {
        Lua = {
            workspace = {
                library = vim.env.VIMRUNTIME
            },
            diagnostics = {
                globals = {
                    "vim"
                }
            }
        }
    }
}
