 require("crates").setup {
     completion = {
         cmp = {
            enabled = true,
         },
        crates = {
            enabled = true, -- disabled by default
            min_chars = 1, -- The minimum number of charaters to type before completions begin appearing
        },
         lsp = {
             enabled = true,
             actions = true,
             completion = true,
             hover = true,
         },
     }
}
