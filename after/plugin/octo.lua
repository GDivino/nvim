local octo = require("octo")
vim.keymap.set("n", "<leader>oc", ":Octo pr create <CR>")
vim.keymap.set("n", "<leader>ol", ":Octo pr list <CR>")
vim.keymap.set("n", "<leader>oe", ":Octo pr edit ")
vim.g.octo_viewer = "GDivino"

octo.setup({
  enable_builtin = true,
  default_remote = { "upstream", "origin" }, -- order to try remotes
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
  picker = "telescope",                    -- or "fzf-lua"
  comment_icon = "▎", -- comment marker
  outdated_icon = "󰅒 ", -- outdated indicator
  resolved_icon = " ", -- resolved indicator
  reaction_viewer_hint_icon = " ", -- marker for user reactions
  user_icon = " ", -- user icon
  timeline_marker = " ", -- timeline marker
  timeline_indent = "2", -- timeline indentation
  right_bubble_delimiter = "", -- bubble delimiter
  left_bubble_delimiter = "", -- bubble delimiter
  github_hostname = "", -- GitHub Enterprise host
  snippet_context_lines = 4, -- number or lines around commented lines
  gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
  timeout = 10000, -- timeout for requests between the remote server
  ui = {
    use_signcolumn = true, -- show "modified" marks on the sign column
  },
  issues = {
    order_by = {            -- criteria to sort results of `Octo issue list`
      field = "CREATED_AT", -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction =
      "DESC"                -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    }
  },
  pull_requests = {
    order_by = {                             -- criteria to sort the results of `Octo pr list`
      field = "CREATED_AT",                  -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction =
      "DESC"                                 -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    },
    always_select_remote_on_create = false -- always give prompt to select base remote repo when creating PRs
  },
  file_panel = {
    size = 10,       -- changed files panel rows
    use_icons = true -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
  },
  colors = {         -- used for highlight groups (see Colors section below)
    white = "#ffffff",
    grey = "#2A354C",
    black = "#000000",
    red = "#fdb8c0",
    dark_red = "#da3633",
    green = "#acf2bd",
    dark_green = "#238636",
    yellow = "#d3c846",
    dark_yellow = "#735c0f",
    blue = "#58A6FF",
    dark_blue = "#0366d6",
    purple = "#6f42c1",
  },
})

