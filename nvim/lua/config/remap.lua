local map = vim.keymap.set

--netrw
map("n", "<leader>pv", vim.cmd.Ex)

-- telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- normal cursor move
map({'n', 'v'}, 'h', function()
  return vim.fn.col('.') == 1 and 'k$' or 'h'
end, {expr = true})

map({'n', 'v'}, 'l', function()
  return vim.fn.col('.') >= #vim.fn.getline('.') and 'j0' or 'l'
end, {expr = true})
-- vim motions in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
-- Helper function for column-aware movement
local function insert_move(key, fallback)
  return function()
    local col = vim.fn.col('.')
    local line_length = #vim.fn.getline('.')

    if key == 'h' and col == 1 then
      return '<Esc>k$i'
    elseif key == 'l' and col >= line_length then
      return '<Esc>j0i'
    else
      return fallback
    end
  end
end

-- Insert mode mappings with Ctrl
map("i", "<C-h>", insert_move('h', '<Left>'), { expr = true, desc = "move left or up" })
map("i", "<C-l>", insert_move('l', '<Right>'), { expr = true, desc = "move right or down" })
--neotree
map('n', '<leader>e', '<Cmd>Neotree toggle reveal=true position=left<CR>', {silent = true})
-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map('n', 'K', vim.lsp.buf.hover, {})
map('n', 'gD', vim.lsp.buf.declaration, {})
map('n', 'gd', vim.lsp.buf.definition, {})
map('n', 'gi', vim.lsp.buf.implementation, {})
map({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
