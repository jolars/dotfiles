require('plugins')
require('keybindings')
require('autocommands')

local g, o, wo, bo = vim.g, vim.o, vim.wo, vim.bo
local utils = require 'utils'
local opt = utils.opt

local buffer = { o, bo }
local window = { o, wo }

opt('inccommand', 'nosplit') -- Incremental live completion
opt('number', true, window) -- Make line numbers default
opt('hidden', true) -- Do not save when switching buffers

-- Show upcoming lines when scrolling
opt('scrolloff', 4, window)

-- Searching
opt('hlsearch', false) -- Set highlight on search
opt('ignorecase', true) --Case insensitive searching 
opt('smartcase', true)

-- Save undo history
opt('undofile', true, buffer)

-- Enable mouse
opt('mouse', 'nivh')

-- Faster refresh
opt('updatetime', 500)

-- Word wrap stuff 
opt('textwidth', 0, buffer)
opt('colorcolumn', '81')
opt('wrap', true)
opt('linebreak', true)
opt('whichwrap', vim.o.whichwrap .. '<,>,h,l')

-- Indentation (some of it overwritten by vim-sleuth)
opt('shiftwidth', 2, buffer)
opt('tabstop', 2, buffer)
opt('softtabstop', 2, buffer)
opt('expandtab', true, buffer)

-- Make room for signs in the gutter
opt('signcolumn', 'yes:1', window)

-- Better autoindentation
opt('smartindent', true, buffer)
opt('breakindent', true, window)

-- More status
opt('laststatus', 2)

-- Disable some messagin
opt('shortmess', o.shortmess .. 'c')

-- Concealment
opt('conceallevel', 0, window)
opt('concealcursor', 'nc', window)

-- More natural splitting
opt('splitbelow', true)
opt('splitright', true)

-- Spelling
opt('spelllang', 'en_us,sv')

-- Code completion
opt('completeopt', 'menuone,noselect')

-- Wild menu
opt('wildignore', '*.o,*~,*.pyc')
opt('wildmode', 'longest:full,full')
        
-- Set colorscheme (order is important here)
opt('termguicolors', true)
g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]

-- Close netrw buffers when exiting
g.netrw_fastbrowse = 0
g.netrw_liststyle = 0

