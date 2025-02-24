require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^4",
    import = "astronvim.plugins",
    opts = {
      mapleader = " ",
      maplocalleader = ",",
      icons_enabled = true,
      pin_plugins = nil,
      update_notifications = true,
    },
  },
  { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
  { import = "community" },
  { import = "plugins" },
  -- Agregar los plugins necesarios para Java y Spring Boot
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "java", -- Asegúrate de que el parser de Java esté instalado
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "jdtls", -- Instalar el servidor LSP de Java
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "jdtls", -- Asegúrate de que jdtls esté configurado
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").jdtls.setup({}) -- Configura el servidor LSP de Java
    end,
  },
  {
    "nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Integración de LSP con nvim-cmp
    },
  },
  
} --[[@as LazySpec]], {
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
