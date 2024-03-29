local M = {}
local logo = {
  "                         .^!^                   SPELL                   .!~:                        ",
  "                    ^!JPB&B!.                                            !&&BPJ!:                   ",
  "                ^?P#@@@@@G.                   :       :                   !@@@@@&BY!:               ",
  "             ^JB@@@@@@@@@7                   .#~     ?P                   .&@@@@@@@@&G?:            ",
  "          .7G@@@@@@@@@@@@#!                  ?@#^   ~@@^                 .5@@@@@@@@@@@@@G7.         ",
  "        .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y&@@@@@@@@@@@@@@@@#?.       ",
  "       !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  !@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@B!      ",
  "     .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y     ",
  "    :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5    ",
  "   .B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?   ",
  "   5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGPP5PPPGBB#&#.  ",
  "   ^:..           .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.  ",
  "                       ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y.                      ",
  "                         P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                        ",
  "                         :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                        ",
  "                                         :?G@@@@@@@@@@@@P!.                                         ",
  "                                            ~5@@@@@@@@5^                                            ",
  "                                              ^P@@@@G^                                              ",
  "                                                !#@?                                                ",
  "                                                 :^ ",
}

M.ui = {
  statusline = {
    separator_style = "block",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },
}

M.alpha = {
  header = {
    type = "text",
    val = logo,
    opts = {
      position = "center",
      hl = "AlphaHeader",
    },
  },
}

M.cmp = function()
  local cmp = require "cmp"
  return {
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }
end

M.nvimtree = {
  filters = {
    dotfiles = false,
    exclude = {},
    custom = {
      ".git$",
      ".github$",
      ".idea$",
      ".vscode$",
      ".DS_Store$",
    },
  },
  open_on_setup = true,
  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    highlight_opened_files = "all",
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "http",
    "json",
    "python",
    "php",
    "sql",
    "graphql",
    "markdown",
    "dockerfile",
    "bash",
    "lua",
    "regex",
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

M.comment = {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- web dev
    "stylelint-lsp",
    "css-lsp",
    "cssmodules-language-server",
    "html-lsp",
    "eslint-lsp",
    "eslint_d",
    "typescript-language-server",
    "emmet-ls",
    "json-lsp",
    "prettier",
    "prettierd",
    -- docker
    "dockerfile-language-server",
    -- other
    "codespell",


  },
}

M.blankline = {
  show_current_context = true,
}

return M
