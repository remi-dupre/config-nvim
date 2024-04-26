vim.g.mapleader = ","
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn =
'+1,+2,+3,+4,+5,+6,+7,+8,+9,+10,+11,+12,+13,+14,+15,+16,+17,+18,+19,+20,+21,+22,+23,+24,+25,+26,+27,+28,+29,+30,+31,+32,+33,+34,+35,+36,+37,+38,+39,+40,+41,+42,+43,+44,+45,+46,+47,+48,+49,+50,+51,+52,+53,+54,+55,+56,+57,+58,+59,+60,+61,+62,+63,+64,+65,+66,+67,+68,+69,+70,+71,+72,+73,+74,+75,+76,+77,+78,+79,+80,+81,+82,+83,+84,+85,+86,+87,+88,+89,+90,+91,+92,+93,+94,+95,+96,+97,+98,+99,+100,+101,+102,+103,+104,+105,+106,+107,+108,+109,+110,+111,+112,+113,+114,+115,+116,+117,+118,+119,+120,+121,+122,+123,+124,+125,+126,+127,+128,+129,+130,+131,+132,+133,+134,+135,+136,+137,+138,+139,+140,+141,+142,+143,+144,+145,+146,+147,+148,+149,+150,+151,+152,+153,+154,+155,+156,+157,+158,+159,+160,+161,+162,+163,+164,+165,+166,+167,+168,+169,+170,+171,+172,+173,+174,+175,+176,+177,+178,+179,+180,+181,+182,+183,+184,+185,+186,+187,+188,+189,+190,+191,+192,+193,+194,+195,+196,+197,+198,+199,+200,+201,+202,+203,+204,+205,+206,+207,+208,+209,+210,+211,+212,+213,+214,+215,+216,+217,+218,+219,+220,+221,+222,+223,+224,+225,+226,+227,+228,+229,+230,+231,+232,+233,+234,+235,+236,+237,+238,+239,+240,+241,+242,+243,+244,+245,+246,+247,+248,+249,+250,+251,+252,+253,+254,+255,+256'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.listchars = 'trail:·,nbsp:␣,tab:» "'
vim.opt.list = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.backspace = '2'
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Remove highlighting when entering insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  pattern  = '*',
  callback = function()
    vim.cmd [[ call feedkeys("\<Cmd>noh\<cr>" , 'n') ]]
  end
})

-- Auto reformat
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('auto_format', {}),
  callback = function()
    vim.lsp.buf.format {
      filter = function(client)
        -- Filter out tsserver which should be overriden by prettier from null_ls
        return client.name ~= "tsserver"
      end,
    }
  end
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})

-- Install plugins and colorscheme
require 'plugins'
require 'keys'

require 'languages.helm'
require 'languages.javascript'
require 'languages.lua'
require 'languages.nix'
require 'languages.python'
require 'languages.rust'
require 'languages.yaml'

-- Set color scheme and adjustments
vim.cmd [[
    hi LineNr       guibg=NONE  ctermbg=NONE
    hi Normal       guibg=NONE  ctermbg=NONE
    hi SignColumn   guibg=NONE  ctermbg=NONE
    hi FoldColumn   guibg=NONE  ctermbg=NONE
    hi VertSplit    guibg=NONE  ctermbg=NONE    guifg=234   ctermfg=234
    hi StatusLine   guibg=235   ctermbg=235
    hi StatusLineNC guibg=235   ctermbg=235
    hi RustCommentLineDoc guifg=248 ctermfg=248

    hi EndOfBuffer  guibg=232   ctermfg=232
    hi ColorColumn  guibg=232   ctermbg=232
    hi CursorLine   guibg=233   ctermbg=233

    hi DiffText     guibg=22    ctermbg=22      cterm=NONE
    hi DiffAdd      guibg=22    ctermbg=22
    hi DiffChange   guibg=234   ctermbg=234
    hi DiffDelete   guibg=234   ctermbg=234
]]

