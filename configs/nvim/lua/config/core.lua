vim.opt.number = true           
vim.opt.relativenumber = true   
vim.opt.shiftwidth = 4          
vim.opt.tabstop = 2
vim.opt.softtabstop = 4
vim.opt.expandtab = true        
vim.opt.mouse = "a"             
vim.opt.termguicolors = true 
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.swapfile = false
vim.opt.colorcolumn = "90"

vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
vim.keymap.set('n', 'Ж', ':', { noremap = true })


-- Disable default tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Setup cmd language --
local ru = "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ"
local en = "qwertyuiop[]asdfghjkl;'zxcvbnmQWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM"

local char_count = vim.fn.strchars(ru)

for i = 0, char_count - 1 do
    local r_char = vim.fn.strcharpart(ru, i, 1)
    local e_char = vim.fn.strcharpart(en, i, 1)
    
    vim.keymap.set('c', r_char, e_char)
end


-- Copy from remote host --
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
