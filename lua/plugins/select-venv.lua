return {
  "linux-cultist/venv-selector.nvim",
  cmd = "VenvSelect",
  opts = {
    search = {
      my_venvs = {
        command = "fd -H -I -p python.exe$ " .. vim.fn.expand("~") .. "/my_projects",
      },
    }, -- if you add your own searches, they go here.
    options = {
      notify_user_on_venv_activation = true,
    },
  },
  --  Call config for Python files and load the cached venv automatically
  ft = "python",
  keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
}
