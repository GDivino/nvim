local yaml = require('yaml_nvim')

vim.keymap.set('n', '<leader>yt', function() yaml.view() end)
vim.keymap.set('n', '<leader>ys', function() yaml.telescope() end)
