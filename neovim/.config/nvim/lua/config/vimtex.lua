local g = vim.g

--if empty(v:servername) && exists('*remote_startserver')
--  call remote_startserver('VIM')
--endif

g.vimtex_compiler_prognam = "nvr"
g.vimtex_view_method = "zathura"
g.vimtex_quickfix_open_on_warning = 0
g.vimtex_syntax_conceal = { foo = true }
g.tex_conecal = ""
-- g.vimtex_syntax_conceal_default = 0

-- " let g:vimtex_view_general_viewer = 'okular'
-- " let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
-- " let g:vimtex_view_general_options_latexmk = '--unique'
-- let g:vimtex_quickfix_open_on_warning = 0
--
-- let g:vimtex_syntax_conceal = {
--       \ 'math_bounds': v:false
--       \}
