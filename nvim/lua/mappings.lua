require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del
local kopts = { noremap = true, silent = true }

-- remove key from nvchad
nomap("n", "<leader>wK")

nomap("n", "<leader>wk")

map("n", ";", ":", { desc = "CMD enter command mode" })

-- save on leader w
map("n", "<leader>w", "<cmd>w<CR>", { desc = "general save file", nowait = true })
-- Save with C-s in insert mode
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Select All
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { silent = true })
-- vim.keymap.del("i", "<C-h>")
-- vim.keymap.del("i", "<C-l>")
-- vim.keymap.del("i", "<C-j>")
-- vim.keymap.del("i", "<C-k>")
--
map("i", "jk", "<ESC>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
-- map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
-- map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
--
map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>c", "<cmd>:lua require('nvchad.tabufline').close_buffer()<CR>")
map("n", "<leader>lg", "<cmd>:lua require('logsitter').log()<CR>")

map("n", "<leader>fr", "<cmd> Lspsaga finder <CR>")
map("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })
map("n", "gj", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })

map("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>", { desc = "Lspsaga code action", remap = true })
map("n", "<leader>ct", "<CMD>Lspsaga outline<CR>", { desc = "Lspsaga code action", remap = true })

-- hlslens
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

map("n", "<leader>re", "<CMD>RegexplainerShowPopup<CR>", { desc = "explain regex", remap = true, silent = true })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree", nowait = true })
-- Set up terminal mappings
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    -- Map <C-k> to move to the above buffer
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
    -- Map <C-j> to move to the below buffer
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
    -- Additional terminal navigation mappings (optional)
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  end,
})
-- Setup for leap
vim.keymap.set({ "n", "x", "o" }, "ga", function()
  require("leap.treesitter").select()
end)

-- Linewise.
vim.keymap.set({ "n", "x", "o" }, "gA", 'V<cmd>lua require("leap.treesitter").select()<cr>')
