local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = {
    'one_light',
    'catppuccin',
  },
  theme = 'catppuccin',

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = 'default',  -- default/vscode/vscode_colored/minimal
    separator_style = 'block',  -- default/round/block/arrow

    overriden_modules = function(modules)
      modules[10] = (function()
        local left_sep = '%#St_pos_sep#' .. '█' .. '%#St_pos_icon#' .. ' '
        local current_column = vim.fn.col '.'
        local current_line = vim.fn.line '.'
        local total_line = vim.fn.line '$'
        local percentage = math.modf((current_line / total_line) * 100)
        local text = string.format('%2d', percentage) .. '%%'

        text = (current_line == 1 and 'Top') or text
        text = (current_line == total_line and 'Bot') or text

        text = string.format('%3s %-3d', text, current_column)

        return left_sep .. '%#St_pos_text#' .. ' ' .. text .. ' '
      end)()
    end,
  },

}

M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'

-- load default list of disabled plugins in NvChad
local default_disabled_plugins = require('plugins.configs.lazy_nvim').performance.rtp.disabled_plugins

-- specify which plugins should be removed from default disabled list
local enabled = {
  netrwPlugin = true,
}
-- enable those plugins
local i=1
while i <= #default_disabled_plugins do
    if enabled[default_disabled_plugins[i]] then
        table.remove(default_disabled_plugins, i)
    else
        i = i + 1
    end
end
-- print(vim.inspect(default_disabled_plugins))

M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = default_disabled_plugins,
    },
  },
}

return M
