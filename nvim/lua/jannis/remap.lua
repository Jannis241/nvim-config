
vim.g.mapleader = " "


-- copy with ctrl c 
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Optional: Remap Ctrl+V in insert mode to paste from the system clipboard
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<C-v>', '<C-r>+', { noremap = true, silent = true })


function RunCargo()

  -- Datei speichern
  vim.cmd('write')

  vim.cmd('terminal')
  vim.cmd('startinsert')  -- Wechselt in den Insert-Modus, damit der Befehl ausgeführt werden kann
  vim.fn.feedkeys("cargo run\n")
end


vim.keymap.set("n", "<leader>ppv", vim.cmd.Ex)

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")


vim.api.nvim_set_keymap('n', '<leader>r', ':lua RunCargo()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<esc>', 'exit<CR>', { noremap = true, silent = true })


vim.keymap.set("n", "<leader>pv", ":Neotree<CR>")







vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")


vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
