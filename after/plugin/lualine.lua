local yaml = require('yaml_nvim')
local GDivino_Lualine = vim.api.nvim_create_augroup("GDivino_Lualine", {})
local autocmd = vim.api.nvim_create_autocmd

local function luaLineConf(content)
    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
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
            lualine_b = content,
        }
    })
end

-- BufNew: triggers autocmd after exiting command line
-- BufEnter: triggers autocmd after exiting telescope or similar tools that pop up like telescope
-- BufWinEnter: triggers autocmd when opening the file
autocmd({ 'BufWinEnter', 'BufEnter', 'BufNew', 'FileType', 'BufWrite' }, {
    group = GDivino_Lualine,
    pattern = '*',
    callback = function()
        if vim.bo.ft ~= 'yaml' then
            luaLineConf({ 'filename' })
            return
        end

        luaLineConf({ yaml.get_yaml_key })
    end
})

