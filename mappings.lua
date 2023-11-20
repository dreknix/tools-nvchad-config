local M = {}

-- Disable default mapping of:
M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  }
}

M.general = {
  n = {
    -- switch between windows
    ['<A-Left>'] = { '<cmd> TmuxNavigateLeft <CR>', 'Window left' },
    ['<A-Right>'] = { '<cmd> TmuxNavigateRight <CR>', 'Window right' },
    ['<A-Down>'] = { '<cmd> TmuxNavigateDown <CR>', 'Window down' },
    ['<A-Up>'] = { '<cmd> TmuxNavigateUp <CR>', 'Window up' },

    ["<A-S-Left>"] = { "<cmd> bprevious <CR>", "Previous tab" },
    ["<A-S-Right>"] = { "<cmd> bnext <CR>", "Previous tab" },

    ["<C-S-Up>"] = { "<cmd> cprev <CR>", "Previous Quicklist location" },
    ["<C-S-Down>"] = { "<cmd> cnext <CR>", "Next Quicklist location" },

    ["<C-S-Left>"] = { "<cmd> tabprevious <CR>", "Previous tab" },
    ["<C-S-Right>"] = { "<cmd> tabnext <CR>", "Next tab" },

    ["<leader>y"] = { "<cmd> tabedit README.md <CR>", "Open README.md in tab" },

    ['<F2>'] = {
      function()
        vim.opt.list = not(vim.opt.list:get())
      end,
      'toogle display of unprintable characters',
    },
    ['<F3>'] = {
      function()
        vim.opt.number = not(vim.opt.number:get())
      end,
      'toogle display of line numbers',
    },
    ['<F4>'] = {
      function()
        vim.opt.relativenumber = not(vim.opt.relativenumber:get())
      end,
      'toogle display of relative line numbers',
    },
    ['<F5>'] = {
      function()
        local qf_exists = false
        for _, win in pairs(vim.fn.getwininfo()) do
          if win["quickfix"] == 1 then
            qf_exists = true
          end
        end
        if qf_exists == true then
          vim.cmd "cclose"
          return
        end
        if not vim.tbl_isempty(vim.fn.getqflist()) then
          vim.cmd "copen | wincmd p" -- open quickfix and stay in current window
        end
      end,
      'toogle quickfix list',
    },
  }
}

M.dap = {
  plugin = true,
  n = {
    ['<leader>db'] = {'<cmd> DapToggleBreakpoint <CR>', 'Toggle Breakpoint'},
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ['<leader>dbr'] = {
      function()
        require('dap-python').test_method()
      end
    },
  },
}

return M
