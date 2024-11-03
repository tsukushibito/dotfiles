return {
  'rmagatti/auto-session',
  lazy = false,
  cond = not vim.g.vscode,
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  }
}
