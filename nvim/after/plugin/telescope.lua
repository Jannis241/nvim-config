local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', function()

	builtin.grep_string({ search = vim.fn.input("Grep > ") });

end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", "<leader>pw", builtin.current_buffer_fuzzy_find, {})

-- Live Grep
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

-- Grep mit Drop-Down Menü
vim.keymap.set('n', '<leader>pg', function()
  builtin.grep_string(themes.get_dropdown({
    winblend = 10,
    previewer = true,
  }))
end)
vim.keymap.set('n', '<leader>pws', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)



