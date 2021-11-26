local cmd = vim.cmd

-- Highlight on yank
cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

cmd([[
  au TermEnter * setlocal scrolloff=0
  au TermLeave * setlocal scrolloff=3
]])

