-- Install packer if not installed
local install_path = vim.fn.stdpath "data"
  .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute(
    "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
  )
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
  ]],
  false
)

-- Recompile when plugins.lua changes
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

local packer = require "packer"
local use = packer.use

packer.startup(function()
  -- Package manager (manages itself)
  use "wbthomason/packer.nvim"

  -- Unix commands for vim
  use "tpope/vim-eunuch"

  -- Asynchronous make
  use "tpope/vim-dispatch"

  -- Git
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require('config.gitsigns')]],
  }

  -- Latex
  use { "lervag/vimtex", setup = [[require('config.vimtex')]] }

  -- Repeat Plugin Commands
  use "tpope/vim-repeat"

  -- See key mappings interactively
  -- use {
  --   'AckslD/nvim-whichkey-setup.lua',
  --   config = [[require('config.whichkey')]],
  --   requires = {'liuchengxu/vim-which-key'},
  -- }

  -- Comment out code
  use {
    "terrortylor/nvim-comment",
    config = [[require('config.comment')]],
  }

  -- Register preview
  use {
    "tversteeg/registers.nvim",
    keys = { { "n", '"' }, { "i", "<c-r>" } },
  }

  -- Searching UI
  use {
    {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-telescope/telescope-media-files.nvim",
      },
      config = [[require('config.telescope')]],
      cmd = "Telescope",
      module = "telescope",
    },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  }
  -- Improve quickfix
  -- use "kevinhwang91/nvim-bqf"

  -- Start screen for neovim
  use "mhinz/vim-startify"

  -- Session handling
  use {
    "dhruvasagar/vim-prosession",
    -- setup = [[
    --   vim.g.prosession_on_startup = 0
    -- ]],
    config = [[require('config.prosession')]],
    requires = { "tpope/vim-obsession" },
  }

  -- Theme
  use "joshdick/onedark.vim"

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = [[require('config.lualine')]],
  }

  -- Buffer line
  use {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('config.bufferline')]],
    -- event = 'User ActuallyEditing'
  }

  -- Kill buffers without closing windows
  -- use "qpkorr/vim-bufkill"
  use "mhinz/vim-sayonara"

  -- Dev-icons
  use "kyazdani42/nvim-web-devicons"

  -- Add indentation guides even on blank lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require('config.indent-blankline')]],
  }

  -- Colorizer
  use { "norcalli/nvim-colorizer.lua" }

  -- Smarter replacements
  use "vim-scripts/ReplaceWithRegister"

  -- Automatically set indentation type
  use "tpope/vim-sleuth"

  -- Text Objections and Motions
  use "chaoren/vim-wordmotion"
  use "wellle/targets.vim"
  use "justinmk/vim-sneak"
  use "kana/vim-textobj-user"
  use "kana/vim-textobj-entire"
  use "michaeljsmith/vim-indent-object"

  -- Align at character
  use {
    "junegunn/vim-easy-align",
  }

  -- File Manger
  -- use "tpope/vim-vinegar"
  -- use {
  --   "francoiscabrol/ranger.vim",
  --   setup = [[
  --     vim.g.ranger_map_keys = 0
  --   ]],
  --   requires = "rbgrouleff/bclose.vim",
  -- }

  -- Edit CSV files
  use "chrisbra/csv.vim"

  -- REPL manager
  -- use {
  --   "kassio/neoterm",
  --   setup = [[
  --     local g = vim.g
  --     g.neoterm_autoscroll = true
  --     -- g.neoterm_bracketed_paste = true
  --     g.neoterm_default_mod = 'vertical'
  --     g.neoterm_fixedsize = false
  --     -- g.neoterm_repl_python = "python"
  --     g.neoterm_repl_enable_ipython_paste_magic = true
  --     g.neoterm_repl_r = 'radian'
  --   ]],
  -- }

  use {
    "jpalardy/vim-slime",
    setup = [[
      vim.g.slime_target = "neovim"
      vim.g.slime_no_mappings = 1
    ]]
  }

  use {
    "drmikehenry/vim-headerguard",
    setup = [[
      vim.g.headerguard_use_cpp_comments = 1
    ]]
  }

  use {
    "lambdalisue/vim-pyenv"
  }

  --   -- R
  --   use {
  --     "jalvesaq/Nvim-R",
  --     setup = [[
  --       local g = vim.g
  --       g.R_nvim_wd = 1
  --       g.R_assign = 0
  --       g.R_rmdchunk = 0
  --       g.rrst_syn_hl_chunk = 1
  --       g.rmd_syn_hl_chunk = 1
  --       g.r_indent_align_args = 0
  --       g.r_indent_ess_comments = 0
  --       g.r_indent_ess_compatible = 0
  --     ]]
  --   }

  -- use "mllg/vim-devtools-plugin"

  -- Automatically make nonexistent directories
  use "pbrisbin/vim-mkdir"

  -- Pandoc and RMarkdown support
  use {
    "vim-pandoc/vim-pandoc",
    setup = [[
      local g = vim.g
      g["pandoc#syntax#conceal#use"] = 0
      g["pandoc#modules#disabled"] = {"folding"}
      g["pandoc#formatting#mode"] = "h"
      g["pandoc#formatting#textwidth"] = 80
    ]],
  }
  -- use "vim-pandoc/vim-rmarkdown"
  use "~/vim-plugins/vim-rmarkdown"
  use "vim-pandoc/vim-pandoc-syntax"

  use "dhruvasagar/vim-table-mode"

  -- Wrap function arguments
  use "FooSoft/vim-argwrap"

  -- Formatting
  -- use 'sbdchd/neoformat'
  use {
    "mhartington/formatter.nvim",
    config = [[require('config.formatter')]],
  }

  -- Surround
  use "tpope/vim-surround"

  -- LSP support
  use {
    "onsails/lspkind-nvim",
    "neovim/nvim-lspconfig",
    "folke/trouble.nvim",
    "ray-x/lsp_signature.nvim",
  }
  use {
    "kabouzeid/nvim-lspinstall",
    requires = { "neovim/nvim-lspconfig" },
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-refactor",
      -- 'nvim-treesitter/nvim-treesitter-textobjects',
      "JoosepAlviste/nvim-ts-context-commentstring",
      "~/vim-plugins/nvim-treesitter-textobjects",
    },
    run = ":TSUpdate",
    config = [[require('config.treesitter')]],
  }

  -- Spelling
  use {
    "lewis6991/spellsitter.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
  }

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
    config = [[require('config.luasnip')]],
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      "hrsh7th/cmp-nvim-lsp",
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    },
    config = [[require('config.cmp')]],
    event = "InsertEnter *",
  }

  -- Auto-pairing brackets etc
  use {
    "windwp/nvim-autopairs",
    after = { "nvim-cmp", "nvim-treesitter" },
    config = [[require('config.autopairs')]],
  }
end)
