return {
    cmd = { "ruby-lsp" },
    filetypes = { "ruby", "eruby" },
    init_options = {
        formatter = "standard",
        linters = { "standard" }
    },
    root_markers = { "Gemfile", ".git" },
}
