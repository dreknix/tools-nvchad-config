local overrides = require 'custom.configs.overrides'



local plugins = {
  {
    'williamboman/mason.nvim',
    opts = overrides.mason,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = overrides.treesitter,
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = overrides.nvimtree,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = overrides.blankline,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'f3fora/cmp-spell' },
    },
    opts = {
      sources = {
        -- add all sources from NvChad before extend the list
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        {
          name = 'spell',
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
          },
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end
  },
  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
    config = function()
      require 'custom.configs.lint'
    end
  },
  {
    'mhartington/formatter.nvim',
    event = 'VeryLazy',
    opts = function()
      return require 'custom.configs.formatter'
    end
  },
  {
    'mfussenegger/nvim-dap',
    config = function(_, opts)
      require('core.utils').load_mappings('dap')
    end
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      handlers = {},
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = 'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function(_, opts)
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
      require('core.utils').load_mappings('dap_python')
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end
  }
}

return plugins
