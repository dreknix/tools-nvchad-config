local M = {}

--
-- configure: williamboman/mason.nvim
--

M.mason = {
  ensure_installed = {
    -- lua stuff
    'lua-language-server',
    'stylua',

    -- web dev stuff
    'css-lsp',
    'html-lsp',
    'prettier',

    -- C/C++ stuff
    'clangd',
    'clang-format',
    'codelldb',

    -- shell stuff
    'ansible-language-server',
    'bash-language-server',
    'docker-compose-language-service',
    'dockerfile-language-server',
    'hadolint',
    'jsonlint',
    'marksman',
    'markdownlint',
    'shellcheck',
    'yaml-language-server',
    'yamllint',

    -- Python stuff
    'pyright',
    'flake8',
    'black',
    'pylint',
    'mypy',
    'ruff',
    'debugpy',

    -- TeX, LaTeX stuff
    'texlab',
  },
}

--
-- configure: nvim-treesitter/nvim-treesitter
--

M.treesitter = {
  ensure_installed = {
    'bash',
    'bibtex',
    'c',
    'cpp',
    'css',
    'diff',
    'dockerfile',
    'doxygen',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'go',
    'html',
    'ini',
    'java',
    'javascript',
    'jq',
    'json',
    'latex',
    'lua',
    'luadoc',
    'make',
    'markdown',
    'markdown_inline',
    'matlab',
    'mermaid',
    'ninja',
    'perl',
    'php',
    'phpdoc',
    'python',
    'regex',
    'sql',
    'ssh_config',
    'toml',
    'vim',
    'vimdoc',
    'toml',
    'xml',
    'yaml',
  },
  indent = {
    enable = true,
    -- disable = {
    --   'python'
    -- },
  },
}

--
-- configure: nvim-tree/nvim-tree.lua
--

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    side = "left",
  },

  -- add custom filters see `:help nvim-tree.filters.custom`
  filters = {
    custom = {
      "^.git$",
    },
  },
}

--
-- configure: lukas-reineke/indent-blankline.nvim
--

-- define other symbols for visualizing whitespaces in list mode and disable
-- list mode by default, <F2> toogles list view
vim.opt.list = false
vim.opt.listchars:append({ tab   = '→ ' })  -- u2192
vim.opt.listchars:append({ eol   = '↲'  })  -- u21b2
vim.opt.listchars:append({ space = '·'  })  -- u00b7
vim.opt.listchars:append({ nbsp  = '␣'  })  -- u2423
vim.opt.listchars:append({ trail = '☐'  })  -- u2610

M.blankline = {
  show_end_of_line = true,
}

return M
