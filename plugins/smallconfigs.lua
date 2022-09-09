local M = {}

M.autotag = function()
  local present, autotag = pcall(require, "nvim-ts-autotag")

  if present then
    autotag.setup()
  end
end

M.autosave = function()
  local autosave = require "auto-save"

  autosave.setup {
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)

    execution_message = {
      message = function() -- message to print on save
        return ("AUTO SAVED: at " .. vim.fn.strftime "%H:%M:%S")
      end,
      dim = 0.18, -- dim the color of `message`
      cleaning_interval = 3250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
    trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
    -- function that determines whether to save the current buffer or not
    -- return true: if buffer is ok to be saved
    -- return false: if it's not ok to be saved
    condition = function(buf)
      local fn = vim.fn
      local utils = require "auto-save.utils.data"

      if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
        return true -- met condition(s), can save
      end
      return false -- can't save
    end,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
    callbacks = { -- functions to be executed at different intervals
      enabling = nil, -- ran when enabling auto-save
      disabling = nil, -- ran when disabling auto-save
      before_asserting_save = nil, -- ran before checking `condition`
      before_saving = nil, -- ran before doing the actual save
      after_saving = nil, -- ran after doing the actual save
    },
  }
end

M.shade = function()
  local shade = require "shade"
  shade.setup {
    overlay_opacity = 50,
    opacity_step = 1,
    exclude_filetypes = { "NvimTree" },
  }
end

M.gomove = function()
  local gomove = require "gomove"
  gomove.setup {
    -- whether or not to map default key bindings, (true/false)
    map_defaults = true,
    -- whether or not to reindent lines moved vertically (true/false)
    reindent = true,
    -- whether or not to undojoin same direction moves (true/false)
    undojoin = true,
    -- whether to not to move past end column when moving blocks horizontally, (true/false)
    move_past_end_col = false,
  }
end

return M
