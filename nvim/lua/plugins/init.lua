return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = require "configs.nvimlint",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, conf)
      conf.mapping["<Tab>"] = nil
      conf.mapping["<S-Tab>"] = nil
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {},
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    opts = require "configs.nvimtree",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "gelguy/wilder.nvim",
    event = "VeryLazy",
    dependencies = {
      "romgrk/fzy-lua-native",
    },
    config = require "configs.wilder",
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    opts = require "configs.hlslens",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "gaelph/logsitter.nvim",
    event = "BufEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("logsitter").setup {
        path_format = "default",
        prefix = "🚀",
        separator = "->",
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("lspsaga").setup {
        ui = {
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "",
          incoming = " ",
          outgoing = " ",
          hover = " ",
          kind = {},
        },
      }
    end,
  },
  -- AI
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
        },
      }
    end,
  },
  -- {
  --   "chrisgrieser/nvim-spider",
  --   event = "BufRead",
  -- },

  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "BufEnter",
    config = function()
      require("neoscroll").setup {}
    end,
  },
  {
    "bennypowers/nvim-regexplainer",
    event = "BufRead",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      auto = true,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "LspAttach",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    opts = {
      provider_selector = function(_, __, ___)
        return { "treesitter", "indent" }
      end,
    },
  },
  -- git
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = "<author> • <date> • <summary> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  -- others
  {
    "gen740/SmoothCursor.nvim",
    event = "BufEnter",
    config = function()
      require("smoothcursor").setup {
        autostart = true, -- Automatically start the smooth cursor
        cursor = "", -- Customize the cursor symbol (e.g., an arrow, dot, etc.)
        texthl = "SmoothCursor", -- Highlight group for the cursor
        linehl = nil, -- Disable line highlight
        type = "default", -- Animation type: "default", "exp", "exp2", or "linear"
        fancy = {
          enable = true, -- Enable fancy cursor trails
          head = { cursor = "◉", texthl = "SmoothCursor" },
          body = {
            { cursor = "•", texthl = "SmoothCursorRed" },
            { cursor = "•", texthl = "SmoothCursorOrange" },
            { cursor = "•", texthl = "SmoothCursorYellow" },
            { cursor = "•", texthl = "SmoothCursorGreen" },
            { cursor = "•", texthl = "SmoothCursorBlue" },
            { cursor = "•", texthl = "SmoothCursorIndigo" },
            { cursor = "•", texthl = "SmoothCursorPurple" },
          },
          tail = { cursor = nil, texthl = "SmoothCursor" },
        },
        speed = 25, -- Cursor movement speed (higher values are faster)
        intervals = 35, -- Time interval for animation in milliseconds
        threshold = 2, -- Minimum distance for triggering smooth movement
        timeout = 3000, -- Timeout for cursor animation in milliseconds
      }
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    opts = {
      handlers = {
        diagnostic = true,
      },
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    enabled = false,
    lazy = false,
    opts = {
      -- Cursor color. Defaults to Cursor gui color
      cursor_color = "#d3cdc3",

      -- Background color. Defaults to Normal gui background color
      normal_bg = "#d3cdc3",

      -- Smear cursor when switching buffers
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines
      smear_between_neighbor_lines = true,

      -- Use floating windows to display smears outside buffers.
      -- May have performance issues with other plugins.
      use_floating_windows = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      -- legacy_computing_symbols_support = true,
      -- How fast the smear's head moves towards the target.
      -- 0: no movement, 1: instantaneous, default: 0.6
      stiffness = 0.8,

      -- How fast the smear's tail moves towards the head.
      -- 0: no movement, 1: instantaneous, default: 0.3
      trailing_stiffness = 0.5,

      -- How much the tail slows down when getting close to the head.
      -- 0: no slowdown, more: more slowdown, default: 0.1
      trailing_exponent = 0.1,

      -- Stop animating when the smear's tail is within this distance (in characters) from the target.
      -- Default: 0.1
      distance_stop_animating = 0.05,

      -- Attempt to hide the real cursor when smearing.
      -- Default: true
      hide_target_hack = true,
    },
  },
}
