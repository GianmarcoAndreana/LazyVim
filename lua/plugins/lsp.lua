return{
    {
    "nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                useLibraryCodeForTypes = false
              },
            },
          },
        },
      },
    },
  },
}