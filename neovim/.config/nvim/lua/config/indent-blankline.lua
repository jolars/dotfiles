local g = vim.g

g.indentLine_faster = 1
g.indentLine_fileTypeExclude = {'tex', 'markdown', 'txt', 'startify', 'packer'}
g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
g.indent_blankline_char = '┊'
g.indent_blankline_char_highlight = 'LineNr'
g.indent_blankline_filetype_exclude = { 'help', 'packer' }
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_use_treesitter = true
