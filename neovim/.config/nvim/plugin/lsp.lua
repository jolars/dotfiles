local lspconfig = require "lspconfig"
local trouble = require "trouble"
local lspkind = require "lspkind"
local lsp = vim.lsp
local buf_keymap = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd

local kind_symbols = {
  Text = "",
  Method = "Ƒ",
  Function = "ƒ",
  -- Constructor = '',
  -- Variable = '',
  -- Class = '',
  -- Interface = 'ﰮ',
  Module = "",
  -- Property = '',
  -- Unit = '',
  -- Value = '',
  -- Enum = '了',
  -- Keyword = '',
  -- Snippet = '﬌',
  -- Color = '',
  -- File = '',
  -- Folder = '',
  -- EnumMember = '',
  -- Constant = '',
  -- Struct = '',
}

lspkind.init { symbol_map = kind_symbols }
trouble.setup()
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
  }
)

-- require('lsp_signature').setup {bind = true, handler_opts = {border = 'single'}}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap(
    "n",
    "gd",
    [[<cmd>lua require"telescope.builtin".lsp_definitions(
                   require('telescope.themes').get_dropdown()
                 )<CR>]],
    opts
  )
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap(
    "n",
    "gI",
    '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>',
    opts
  )
  buf_set_keymap("n", "gS", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap("n", "gTD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap(
    "n",
    "gA",
    [[<cmd>lua require"telescope.builtin".lsp_code_actions(
                  require('telescope.themes').get_cursor()
                )<cr>]],
    opts
  )
  buf_set_keymap(
    "n",
    "gr",
    '<cmd>lua require"telescope.builtin".lsp_references()<CR>',
    opts
  )
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(
    "n",
    "<leader>le",
    "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
    opts
  )
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap(
      "n",
      "<localleader>f",
      "<cmd>lua vim.lsp.buf.formatting()<CR>",
      opts
    )
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap(
      "n",
      "<localleader>f",
      "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
      opts
    )
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
      false
    )
  end
end

-- Enable the following language servers
local servers = {
  clangd = {},
  texlab = {},
  pylsp = {},
  r_language_server = {},
  julials = {},
  vimls = {},
  sumneko_lua = {
    cmd = { "lua-language-server" },
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  },
}

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities.textDocument.completion.completionItem.snippetSupport = true
client_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}
client_capabilities = require("cmp_nvim_lsp").update_capabilities(
  client_capabilities
)

for server, config in pairs(servers) do
  if type(config) == "function" then
    config = config()
  end
  config.on_attach = on_attach
  lspconfig[server].setup(config)
  config.capabilities = vim.tbl_deep_extend(
    "keep",
    config.capabilities or {},
    client_capabilities
  )
end
