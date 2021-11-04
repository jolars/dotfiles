-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/gerd-jln/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/gerd-jln/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/gerd-jln/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/gerd-jln/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/gerd-jln/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "require('config.luasnip')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister"
  },
  ["bclose.vim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/bclose.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["formatter.nvim"] = {
    config = { "require('config.formatter')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config.gitsigns')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('config.indent-blankline')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config.lualine')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neoterm = {
    loaded = true,
    needs_bufread = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/neoterm"
  },
  ["nvim-autopairs"] = {
    config = { "require('config.autopairs')" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    config = { "require('config.bufferline')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "cmp-nvim-lua", "cmp-buffer", "cmp-path", "cmp_luasnip" },
    config = { "require('config.cmp')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "require('config.comment')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["ranger.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/ranger.vim"
  },
  ["registers.nvim"] = {
    keys = { { "n", '"' }, { "i", "<c-r>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/registers.nvim"
  },
  ["spellsitter.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('config.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-argwrap"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-argwrap"
  },
  ["vim-bufkill"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-bufkill"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-headerguard"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/vim-headerguard"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-mkdir"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-mkdir"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-pandoc"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/vim-pandoc"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax"
  },
  ["vim-prosession"] = {
    config = { "require('config.prosession')" },
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-prosession"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rmarkdown"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-rmarkdown"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-table-mode"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  vimtex = {
    loaded = true,
    needs_bufread = true,
    path = "/home/gerd-jln/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: neoterm
time([[Setup for neoterm]], true)
      local g = vim.g
      g.neoterm_autoscroll = true
      g.neoterm_bracketed_paste = true
      g.neoterm_default_mod = 'vertical'
      g.neoterm_fixedsize = false
      -- g.neoterm_repl_python = "python"
      g.neoterm_repl_enable_ipython_paste_magic = true
      g.neoterm_repl_r = 'radian'
      --g.neoterm_size = 80
    
time([[Setup for neoterm]], false)
time([[packadd for neoterm]], true)
vim.cmd [[packadd neoterm]]
time([[packadd for neoterm]], false)
-- Setup for: vim-headerguard
time([[Setup for vim-headerguard]], true)
      vim.g.headerguard_use_cpp_comments = 1
    
time([[Setup for vim-headerguard]], false)
time([[packadd for vim-headerguard]], true)
vim.cmd [[packadd vim-headerguard]]
time([[packadd for vim-headerguard]], false)
-- Setup for: vimtex
time([[Setup for vimtex]], true)
require('config.vimtex')
time([[Setup for vimtex]], false)
time([[packadd for vimtex]], true)
vim.cmd [[packadd vimtex]]
time([[packadd for vimtex]], false)
-- Setup for: vim-pandoc
time([[Setup for vim-pandoc]], true)
      local g = vim.g
      g["pandoc#syntax#conceal#use"] = 0
      g["pandoc#modules#disabled"] = {"folding"}
      g["pandoc#formatting#mode"] = "h"
      g["pandoc#formatting#textwidth"] = 80
    
time([[Setup for vim-pandoc]], false)
time([[packadd for vim-pandoc]], true)
vim.cmd [[packadd vim-pandoc]]
time([[packadd for vim-pandoc]], false)
-- Setup for: ranger.vim
time([[Setup for ranger.vim]], true)
      vim.g.ranger_map_keys = 0
    
time([[Setup for ranger.vim]], false)
time([[packadd for ranger.vim]], true)
vim.cmd [[packadd ranger.vim]]
time([[packadd for ranger.vim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('config.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require('config.luasnip')
time([[Config for LuaSnip]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
require('config.comment')
time([[Config for nvim-comment]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require('config.bufferline')
time([[Config for nvim-bufferline.lua]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
require('config.formatter')
time([[Config for formatter.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('config.indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('config.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: vim-prosession
time([[Config for vim-prosession]], true)
require('config.prosession')
time([[Config for vim-prosession]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[nnoremap <silent> " <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "\"", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <c-r> <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "<lt>c-r>" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
