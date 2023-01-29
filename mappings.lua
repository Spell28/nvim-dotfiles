local M = {}

M.misc = {
  i = {
    ["jj"] = { "<ESC>", "escape normal mode" },
  },
  n = {
    ["<leader>q"] = { ":qa!<CR>", "quit for vim" },
    ["<leader>s"] = { ":w<CR>", "save file" },
    -- LSP Saga
    ["<leader>fd"] = { "<cmd>Lspsaga lsp_finder<CR>", "Find Defenitions" },
    ["<leader>k"] = { "<cmd>Lspsaga hover_doc<CR>", "Show Hover Doc" },
    ["<leader>a"] = { "<cmd>Lspsaga code_action<CR>", "Show Code Actions" },
    ["<leader>ld"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "ShowLine diagnostic" },
    -- REST Nvim
    ["<leader>rr"] = { "<Plug>RestNvim<CR>", "Run Request Under Cursor Via RestNvim", opts = { noremap = false } },
  },
  v = {
    ["C-c"] = { "<ESC>", "escape normal mode" },
  },
}

M.tabufline = {
  n = {
    ["<S-H>"] = { "<cmd> TbufLeft <CR>", "move buffer to the left" },
    ["<S-L>"] = { "<cmd> TbufRight <CR>", "move buffer to the right" },
  },
}

return M
