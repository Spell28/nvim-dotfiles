local overrides = require "custom.override"

return {
  ------------------------------------------------------ plugins overrides ----------------------------------------------------------------
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["numToStr/Comment.nvim"] = {
    override_options = overrides.comment,
  },
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },
  ["NvChad/ui"] = {
    override_options = overrides.ui,
  },
  ----------------------------------------------------- plugins installed ----------------------------------------------------------------
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    after = "nvim-treesitter",
  },
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smallconfigs").autotag()
    end,
  },
  ["rest-nvim/rest.nvim"] = {
    config = function()
      require "custom.plugins.rest"
    end,
  },
  ["booperlv/nvim-gomove"] = {
    config = function()
      require("custom.plugins.smallconfigs").gomove()
    end,
  },
  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      require("lspsaga").setup {}
    end,
    requires = { { "nvim-tree/nvim-web-devicons" } },
  },
}
