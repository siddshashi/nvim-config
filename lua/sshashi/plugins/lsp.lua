-- LSP Configuration & Plugins
return {
	{
    "neovim/nvim-lspconfig",
    dependencies = {
      -- LSP installer
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup()
        end,
      },

      -- Bridge between mason and lspconfig
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "pyright",
              "rust_analyzer",
	      "lua_ls",
            },
            automatic_installation = true,
          })
        end,
      },

      config = function()
	      local lspconfig = require("lspconfig")

	      lspconfig.lua_ls.setup({
       		 settings = {
          	Lua = {
            	diagnostics = {
             	 globals = { "vim", "LazyVim" }, -- Recognize `vim` and LazyVim as globals
           	 },
		},
		},
	})
end,
    },
  },
}
