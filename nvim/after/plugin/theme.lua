function apply(theme)
	vim.cmd.colorscheme(theme)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = false,
    bold = true,
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})
require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
    },
})
require("rose-pine").setup({
    -- variant = "moon",
    -- dark_variant = "main", -- main, moon, or dawn
    -- dim_inactive_windows = false,
    -- extend_background_behind_borders = true,

    -- enable = {
    --     terminal = true,
    --     legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    --     migrations = true, -- Handle deprecated options automatically
    -- },

    disable_background = true,
    disable_float_background = true,




    styles = {
        -- bold = true,
        italic = false,
        transparency = false,
    },

    -- groups = {
    --     border = "muted",
    --     link = "iris",
    --     panel = "surface",
    --
    --     error = "love",
    --     hint = "iris",
    --     info = "foam",
    --     note = "pine",
    --     todo = "rose",
    --     warn = "gold",
    --
    --     git_add = "foam",
    --     git_change = "rose",
    --     git_delete = "love",
    --     git_dirty = "rose",
    --     git_ignore = "muted",
    --     git_merge = "iris",
    --     git_rename = "pine",
    --     git_stage = "iris",
    --     git_text = "rose",
    --     git_untracked = "subtle",
    --
    --     h1 = "iris",
    --     h2 = "foam",
    --     h3 = "rose",
    --     h4 = "gold",
    --     h5 = "pine",
    --     h6 = "foam",
    -- },
    --
    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
        Cursor = {fg = "black", bg = "#ffffff"}

    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})

apply("rose-pine-moon")

-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
