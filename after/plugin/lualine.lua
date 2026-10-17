-- NOTE: lualine.setup() used to be re-run in full on every
-- BufWinEnter/BufEnter/BufNew/FileType/BufWrite event. That tore down and
-- recreated lualine's internal libuv timers and rebuilt the whole
-- statusline/tabline/winbar component tree on nearly every editing action,
-- causing unnecessary allocation churn. lualine already has its own
-- `refresh` timers (configured below) that keep the statusline/tabline up
-- to date, so a single setup() call at load time is sufficient.
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                path = 1
            }
        },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    tabline = {
        lualine_b = { 'filename' },
    }
})
