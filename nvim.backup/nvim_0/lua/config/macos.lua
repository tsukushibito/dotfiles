if vim.fn.has('mac') == 1 then
  -- クリップボード使用
  vim.opt.clipboard:append{'unnamedplus'}
end
