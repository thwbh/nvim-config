local cmp = require "cmp"

return {
  -- this was here before and I'm afraid to delete it
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- adds more libraries to install
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer"
      }
    }
  },

  -- general LSP setup
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "configs.lspconfig"
    end,
    dependencies = {
			"pmizio/typescript-tools.nvim", -- Alternative to typescript server (requires plenary)
		},
  },

  -- typescript code completion
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- rust code compeltion
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- rust code completion
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "rust-tools"
    end,
    config = function (_, opts)
      return require "rust-tools".setup(opts)
    end
  },

  {
    "mfussenegger/nvim-dap"
  },

  -- resolve and display cargo crate versions
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function (_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css"
  		},
  	},
    dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring", -- allow comments in mixed content files like jsx, html and svelte
			"windwp/nvim-ts-autotag", -- autoclose html tags
		},
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("refactoring").setup()
    end
  },

  -- Provides a function overview
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },

  -- Makes markdown files prettier
  {
    "OXY2DEV/markview.nvim",
      lazy = false,      -- Recommended
      -- ft = "markdown" -- If you decide to lazy-load anyway

      dependencies = {
          "nvim-treesitter/nvim-treesitter",
          "nvim-tree/nvim-web-devicons"
    }
  },

  -- darcula theme (doesn't work with treeview etc.)
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
  }
}

