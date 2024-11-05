return {
  'rmagatti/auto-session',
  lazy = false,
  cond = not vim.g.vscode,
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    bypass_session_save_file_types = { "NvimTree" },
    -- log_level = 'debug',
  }
}
