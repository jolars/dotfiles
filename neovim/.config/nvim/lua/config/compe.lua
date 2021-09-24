-- local utils = require 'utils'
-- local map = utils.map
local map = vim.api.nvim_set_keymap

-- BASE VIM KEYBINDINGS
local silent = {silent = true}
local silent_remap = {silent = true, noremap = false}
local expr = {expr = true}
local silent_expr = {silent = true, expr = true}

require('compe').setup {
  enabled = true,
  autocomplete = false,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {border = 'single'},

  source = {
    buffer = true,
    calc = true,
    luasnip = true,
    nvim_lsp = true,
    nvim_lua = false,
    path = true,
    treesitter = true,
    ultisnips = false,
    vsnip = false,
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
-- move to prev/next item in completion menu
-- jump to prev/next snippet's placeholder
local luasnip = require 'luasnip'

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif luasnip.expand_or_jumpable() then
    return t '<Plug>luasnip-expand-or-jump'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif luasnip.jumpable(-1) then
    return t '<Plug>luasnip-jump-prev'
  else
    return t '<S-Tab>'
  end
end

-- Map tab to the above tab complete functions
map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- LuaSnip Next Choice for Choice Nodes
map("i", "<c-e>", "<Plug>luasnip-next-choice", silent)
map("s", "<c-e>", "<Plug>luasnip-next-choice", silent)

-- Map compe confirm and complete functions
-- map('i', '<cr>', 'compe#confirm("<cr>")', {expr = true})
-- map('i', '<c-leader>', 'compe#complete()', {expr = true})

--  windwp/nvim-autopairs compatible commands
-- map("i", "<c-leader>", "compe#complete()", silent_expr)
map(
  "i",
  "<cr>",
  "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))",
  silent_expr
)
-- map("i", "<c-e>", "compe#close('<C-e>')", silent_expr)
map("i", "<c-u>", "compe#scroll({ 'delta': +4 })", silent_expr)
map("i", "<c-d>", "compe#scroll({ 'delta': -4 })", silent_expr)

