-- WindowsのシェルはPowerShellにしておく
if vim.fn.has('win32') == 1 then
  print("Use PowerShell")
  vim.o.shell='C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe'
  vim.o.shellcmdflag='-c'
  vim.o.shellquote='\"'
  vim.o.shellxquote=''
end

