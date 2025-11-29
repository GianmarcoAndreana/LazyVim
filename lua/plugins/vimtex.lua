return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    vim.g.vimtex_view_general_viewer = "SumatraPDF"
    vim.g.vimtex_view_general_options = [[-reuse-instance -forward-search @tex @line @pdf]]
    vim.g.vimtex_view_general_options_latexmk = [[-reuse-instance -forward-search @tex @line @pdf]]
    vim.g.vimtex_quickfix_mode = 2 -- Open QuickFix automatically on errors, but not warnings
    vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
    vim.g.vimtex_quickfix_open_on_warning = 0 -- Don't open for warnings
    -- Build engine settings
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
  },
}
