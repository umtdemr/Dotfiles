local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

vim.cmd [[
try
  colorscheme night-owl
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
