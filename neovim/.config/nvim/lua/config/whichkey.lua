local g = vim.g
local utils = require 'utils'
local map = utils.map

map('n', '<leader>', "<cmd>WhichKey '<space>'<cr>", {silent = true})
map('n', '<localleader>', "<cmd>WhichKey '<,>'<cr>", {silent = true})
