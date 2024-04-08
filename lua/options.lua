require "nvchad.options"

-- add yours here!
local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.conceallevel = 2
opt.syntax = 'on'
opt.filetype.plugin = 'on'
opt.termguicolors = true

g.markdown_syntax_conceal = 1

g.autoformat_enabled = true

-- Vim Markdown
g.vim_markdown_folding_disabled = 1
g.vim_markdown_folding_level = 6
