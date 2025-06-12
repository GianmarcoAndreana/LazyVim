return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {
          mason = false,
          cmd = {
            "julia",
            "--startup-file=no",
            "--history-file=no",
            "-e",
            "using LanguageServer; runserver()"
          },
          filetypes = { "julia" },
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
          end,
          single_file_support = true,
          on_attach = function(client, bufnr)
            -- Optional: Add any Julia-specific keybindings here
          end,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "julia" })
      end
    end,
  },
}