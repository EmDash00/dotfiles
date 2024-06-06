require("neorg").setup {
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.completion"] = {
        config = {
            engine = "nvim-cmp",
        },
    },
    ["core.latex.renderer"] = {
      config = {
        render_on_enter = true
      }
    },
    ["core.integrations.image"] = {},
    ["core.looking-glass"] = {}, -- Enable the looking_glass module
    ["core.itero"] = {},
    ["core.export"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = { -- Manage your directories with Neorg
        config = {
            workspaces = {
                default = "~/Documents/Notes/",
            },
            index = "index.norg",
            autodetect = true,
            [[ -- autochdir = false, ]],
            default_workspace = "default",
        },
    },
  }
}
