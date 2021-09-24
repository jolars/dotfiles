local g, o, wo, bo = vim.g, vim.o, vim.wo, vim.bo
local utils = require "utils"
local map = utils.map

-- BASE VIM KEYBINDINGS
local expr = { expr = true }
local remap = { noremap = false }
local silent = { silent = true }
local silent_expr = { silent = true, expr = true }
local silent_remap = { silent = true, noremap = false }
local silent_nowait = { silent = true, nowait = true }

-- Remap space as leader key
map("n", "<space>", "<nop>", silent)
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Common commands
map("n", "<leader>w", "<cmd>w<cr>", silent) -- Write buffer
map("n", "<leader>x", "<cmd>x!<cr>", silent) -- Write buffer
map("n", "<leader>q", "<cmd>q<cr>", silent) -- Quit buffer
map("n", "<leader>d", "<cmd>BD!<cr>", silent_nowait) -- Delete buffer

-- Yank into clipboard
map("n", "<leader>y", '"+y', silent)
map("v", "<leader>y", '"+y', silent)

-- Paste from clipboard
map("n", "<leader>p", '"+p', silent)
map("n", "<leader>P", '"+P', silent)
map("v", "<leader>p", '"+p', silent)

-- Remap for dealing with word wrap
map("n", "k", [[v:count == 0 ? 'gk' : 'k']], silent_expr)
map("n", "j", [[v:count == 0 ? 'gj' : 'j']], silent_expr)

-- Let Y yank until the end of line
map("n", "Y", "y$")

-- Simpler window management
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- Map escape key to exit terminal window
map("t", "<Esc>", "<C-\\><C-n>")

-- Make working directory the directory of the current file
map("n", "<leader>cd", ":cd %:p:h<cr>")

map("n", "<leader>e", ":Explore<cr>")

-- Insert newlines in normal mode
map("n", "<leader>j", "m`o<esc>")
map("n", "<leader>k", "m`O<esc>")

-- Use <c-h> and <c-l> instead of <up> and <down> in wildmenu
map("c", "<c-l>", [[wildmenumode() ? "\<down>" : "\<c-l>"]], silent_expr)
map("c", "<c-h>", [[wildmenumode() ? "\<up>" : "\<c-h>"]], silent_expr)

-- PLUGIN KEYMAPPINGS

-- Easy-Align
map({ "x", "n" }, "ga", "<Plug>(EasyAlign)", silent_remap)

-- Telescope
map(
  "n",
  "<leader>sb",
  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
  silent
)
map(
  "n",
  "<leader>sf",
  [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
  silent
)
map(
  "n",
  "<leader>sc",
  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
  silent
)
map(
  "n",
  "<leader>sh",
  [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
  silent
)
-- map(
--   'n',
--   '<leader>st',
--   [[<cmd>lua require('telescope.builtin').tags()<CR>]],
--   silent
-- )
map(
  "n",
  "<leader>ss",
  [[<cmd>lua require('telescope.builtin').grep_string()<cr>]],
  silent
)
map(
  "n",
  "<leader>sg",
  [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
  silent
)
map(
  "n",
  "<leader>se",
  [[<cmd>lua require('telescope.builtin').file_browser()<cr>]],
  silent
)
-- map('n', 'z=', [[<cmd>lua require('telescope.builtin').spell_suggest()<cr>]],
--     silent)
map(
  "n",
  "z=",
  [[<cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))<CR>]],
  silent
)
-- map(
--   'n',
--   '<leader>st',
--   [[<cmd>lua require('telescope.builtin').tags{
--     only_current_buffer = true
--   }<CR>
--   ]],
--   silent
-- )
map(
  "n",
  "<leader>so",
  [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
  silent
)

-- ArgWrap
map("n", "gw", ":ArgWrap<cr>", silent)

-- Git
map("n", "<leader>g", "<cmd>vertical Git<cr>", silent)

--  REPL
map("v", "gs", "<Plug>(neoterm-repl-send)", remap)
map("n", "gs", "<Plug>(neoterm-repl-send)", remap)
map("n", "gss", "<Plug>(neoterm-repl-send-line)", remap)
map("n", "gsf", "<cmd>treplsendfile<cr>", remap)

-- Format
map("n", "<leader>f", "<cmd>Format<cr>", silent)
map("v", "<leader>f", "<cmd>Format<cr>", silent)

-- Bufferline
map("n", "gb", "<cmd>BufferLinePick<cr>", silent)

-- Ranger
map("n", "<leader>rf", "<cmd>Ranger<cr>")
map("n", "<leader>rw", "<cmd>RangerWorkingDirectory<cr>")
