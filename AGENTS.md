# AGENTS.md - Neovim Configuration Repository Guide

This is a Neovim configuration repository written in Lua. This guide helps coding agents understand the structure, conventions, and workflow for making changes.

## Repository Overview

- **Type**: Neovim configuration
- **Language**: Lua
- **Plugin Manager**: Lazy.nvim
- **Entry Point**: `init.lua` → `lua/gdivino/init.lua`
- **Structure**:
  - `lua/gdivino/` - Core configuration modules
  - `after/plugin/` - Plugin-specific configurations
  - `after/ftplugin/` - Filetype-specific settings
  - `lsp/` - LSP server configurations

## Build/Lint/Test Commands

**Note**: This is a configuration repository, not a software project. There are no build, lint, or test commands.

**Testing Changes**:
- Reload Neovim configuration: `:source %` or `<leader><leader>` (in the file)
- Check for Lua syntax errors: `:lua vim.cmd('luafile %')`
- LSP restart: `<leader>lr`
- Check plugin status: `:Lazy`
- Check LSP status: `:LspInfo`
- Check Mason installations: `:Mason`

**Validation**:
- Ensure Neovim starts without errors: `nvim --headless +qa`
- Check for LSP errors in diagnostic float: `<leader>lv`

## Code Style Guidelines

### Indentation & Formatting

**Default (most files)**:
- 2 spaces for indentation
- No tabs (expandtab enabled)

**Filetype-Specific (4 spaces)**:
- Lua: 4 spaces
- TypeScript/JavaScript/JSX/TSX: 4 spaces
- Python: 4 spaces
- Go: 4 spaces

**Formatting Settings**:
```lua
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
```

### Imports & Module Loading

**Lua Require Pattern**:
```lua
require("module.name")
local module = require("module.name")
```

**Plugin Loading** (in `lua/gdivino/lazy.lua`):
```lua
{
    "author/plugin-name",
    dependencies = { "other/plugin" },
    opts = {},
}
```

### Naming Conventions

**Files**:
- All lowercase
- Use underscores for multi-word names (snake_case)
- Example: `lua_ls.lua`, `ts_ls.lua`

**Variables**:
- snake_case for local variables
- Example: `local GDivino_lsp = vim.api.nvim_create_augroup("GDivino_lsp", {})`

**Keymaps**:
- Use `<leader>` prefix (space key) for custom mappings
- Pattern: `vim.keymap.set("mode", "key", action, opts)`
- Example: `vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")`

### LSP Configuration

**LSP Server Setup**:
- Individual LSP configs in `lsp/` directory
- Each file returns a configuration table
- Pattern:
```lua
return {
    cmd = { "language-server-command" },
    filetypes = { "filetype" },
    root_markers = { "marker-files" },
    settings = { ... }
}
```

**Autocmd Groups**:
- Use `vim.api.nvim_create_augroup()` for organization
- Attach keymaps on `LspAttach` event
- Example naming: `GDivino_lsp`, `GDivino_tf_lsp`

### Plugin Configuration

**Location**: `after/plugin/<plugin-name>.lua`

**Pattern**:
```lua
require('plugin-name').setup({
    -- configuration options
})
```

**Keymaps**: Define plugin-specific keymaps in the same file

### Filetype Settings

**Location**: `after/ftplugin/<filetype>.lua`

**Pattern**:
```lua
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
```

### Error Handling

**Diagnostic Configuration**:
```lua
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
```

**LSP Logging**: Disabled by default
```lua
vim.lsp.set_log_level("off")
```

## Common Patterns

### Adding a New Plugin

1. Add to `lua/gdivino/lazy.lua` plugins table
2. Create config file in `after/plugin/<name>.lua`
3. Restart Neovim and run `:Lazy sync`

### Adding a New LSP

1. Add to Mason ensure_installed in `after/plugin/lsp.lua`
2. Create config file in `lsp/<server-name>.lua`
3. Enable in `vim.lsp.enable()` list
4. Restart Neovim or `:LspRestart`

### Adding Filetype Settings

1. Create `after/ftplugin/<filetype>.lua`
2. Use `vim.opt_local` for buffer-local settings
3. Settings apply automatically when opening that filetype

## File Organization

- Keep core config minimal in `lua/gdivino/`
- Plugin configs go in `after/plugin/`
- Filetype configs go in `after/ftplugin/`
- LSP server configs go in `lsp/`
- Follow existing file naming patterns

## Best Practices

- Use `vim.keymap.set()` instead of `vim.api.nvim_set_keymap()`
- Prefer `vim.opt` over `vim.o` for setting options
- Use `vim.opt_local` for filetype-specific settings
- Group related autocmds with `nvim_create_augroup()`
- Comment sections with `-- ========== section name ==========`
- Test changes by reloading the config before committing
