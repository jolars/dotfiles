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

-- cmd([[
--   augroup Packer
--     autocmd!
--     autocmd!
--   bufs BufWritePost
--     */plugin/init.lua
--       lua refreshPlugins()
-- ]])
  
-- vim.cmd [[ autocmd CursorHold,CursorHoldI * lua LightBulbFunction() ]]
-- vim.cmd 'au CursorHold,CursorHoldI <buffer> lua require"nvim-lightbulb".update_lightbulb {sign = {enabled = false}, virtual_text = {enabled = true, text = ""}, float = {enabled = false, text = "", win_opts = {winblend = 100, anchor = "NE"}}}'

-- vim.cmd(
--   [[
--   augroup DetectIndent
--      autocmd!
--      autocmd BufReadPost *  DetectIndent
--   augroup END
-- ]],
--   false
-- )

