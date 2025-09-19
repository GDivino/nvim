return {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "vscode-json-language-server", "--stdio" },
    init_options = {
        provideFormatter = true
    },
    root_markers = { ".git" },
}
