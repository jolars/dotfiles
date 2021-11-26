local function prettier()
  return {
    exe = "npx prettier",
    args = {
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0),
      "--single-quote",
    },
    stdin = true,
  }
end

local function clangformat()
  return {
    exe = "clang-format",
    args = { "-assume-filename=" .. vim.fn.expand "%:t" },
    stdin = true,
  }
end

local function rustfmt()
  return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
end

local function yapf()
  return { exe = "yapf", stdin = true }
end

local function isort()
  return { exe = "isort", args = { "-", "--quiet" }, stdin = true }
end

local function latexindent()
  local shiftwidth = vim.o.shiftwidth
  local expandtab = vim.o.expandtab
  local rep = string.rep

  indent_string = "\\t"

  if expandtab then
    indent_string = " "
  end

  indent = rep(indent_string, shiftwidth)

  local indent_option = "-y=\"defaultIndent:'" .. indent .. "'\""

  return {
    exe = "latexindent",
    args = {
      "-m",
      "-r",
      indent_option,
      "-g /dev/stderr 2>/dev/null",
    },
    stdin = true,
  }
end

local function latexindent2()
  local indent_option = "-y=\"defaultIndent:'" .. indent .. "'\""

  return {
    exe = "latexindent",
    args = {
      "-m",
      "-r",
      '-y="defaultIndent: \t"',
      "-g /dev/stderr 2>/dev/null",
    },
    stdin = true,
  }
end
local function cmake_format()
  return { exe = "cmake-format", args = { vim.fn.expand "%:t" }, stdin = false }
end

local function luaformat()
  return { exe = "lua-format", stdin = true }
end

local function stylua()
  return {
    exe = "stylua",
    args = { "--search-parent-directories", "-" },
    stdin = true,
  }
end

local function juliaformatter()
  return {
    exe = "julia",
    args = {
      '--project -e "using JuliaFormatter; print(format_text(String(read(stdin)), BlueStyle()))"',
    },
    stdin = true,
  }
end

local function r_styler()
  return {
    exe = "Rscript",
    args = {
      "-e \"con <- file('stdin');",
      "out <- styler::style_text(readLines(con));",
      "close(con);",
      'out"',
    },
    stdin = true,
  }
end

local function r_styler2()
  return {
    exe = "Rscript",
    args = {
      "-e 'options(styler.quiet = TRUE);",
      'styler::style_file("' .. vim.fn.expand "%:t" .. "\")'",
    },
    stdin = false,
  }
end

require("formatter").setup {
  logging = false,
  filetype = {
    bib = { latexindent2 },
    c = { clangformat },
    cmake = { cmake_format },
    cpp = { clangformat },
    html = { prettier },
    javascript = { prettier },
    json = { prettier },
    julia = { juliaformatter },
    lua = { stylua },
    markdown = { prettier },
    python = { isort, yapf },
    pandoc = { prettier },
    r = { r_styler },
    rmarkdown = { r_styler2 },
    rust = { rustfmt },
    tex = { latexindent },
  },
}
