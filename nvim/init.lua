-- ==========================================================================
-- 1. OPCIONES BASE
-- ==========================================================================
local opt = vim.opt

opt.termguicolors = true           -- Soporte de colores verdaderos
opt.clipboard = "unnamedplus"      -- Portapapeles del sistema

opt.number = true                  -- Números de línea
opt.mouse = 'a'                     -- Soporte del ratón
opt.laststatus = 2                 -- Siempre mostrar barra de estado
opt.wrap = false                    -- Sin ajuste de línea

opt.splitright = true             -- Splits verticales a la derecha
opt.splitbelow = true              -- Splits horizontales abajo

opt.tabstop = 2                    -- Ancho de tabulación
opt.shiftwidth = 2                 -- Ancho de indentación
opt.expandtab = true               -- Espacios en lugar de tabs
opt.autoindent = true             -- Sangría automática
opt.smartindent = true            -- Sangría inteligente

opt.foldmethod = 'indent'          -- Pliegues por indentación

opt.guifont = "Monospace,FiraCode Nerd Font:h12"  -- Fuente con fallback de iconos

vim.g.python3_host_prog = '/usr/bin/python3'  -- Intérprete Python 3

vim.g.loaded_perl_provider = 0     -- Desactivar providers sin uso
vim.g.loaded_ruby_provider = 0

-- ==========================================================================
-- 2. BOOTSTRAP DE LAZY.NVIM
-- ==========================================================================
vim.g.loaded_netrw = 1             -- Desactivar explorador nativo
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ==========================================================================
-- 3. PLUGINS
-- ==========================================================================
require("lazy").setup({

  -- Tema: Badwolf (oscuro)
  {
    "sjl/badwolf",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme badwolf")
    end
  },

  { "nvim-tree/nvim-web-devicons" },  -- Soporte de iconos

  -- Barra de estado
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { options = { theme = "auto" } }
  },

  -- Explorador de archivos
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { width = 35 },
      renderer = { group_empty = true },
    }
  },

  -- Guías de indentación
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- Auto-cierre de paréntesis
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- Indicadores de git
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      end
    }
  },

  { "tpope/vim-fugitive" },        -- Comandos git

  { "mg979/vim-visual-multi", branch = "master" },  -- Multi-cursor

  { "easymotion/vim-easymotion" }, -- Movimiento rápido

  { "preservim/tagbar" },          -- Explorador de tags (:TagbarToggle)

  { "mattn/emmet-vim" },           -- Abreviaciones HTML (<C-y>,)

  { "godlygeek/tabular" },         -- Alineación de código (:Tabularize /patrón)

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    dependencies = { "rafamadriz/friendly-snippets" }
  },

  { "wakatime/vim-wakatime", lazy = false },  -- Métricas de codificación
})

-- ==========================================================================
-- 4. ATAJOS DE TECLADO
-- ==========================================================================
local map = vim.keymap.set

-- Modo inserción
map('i', '<C-BS>', '<C-W>')               -- Borrar palabra
map('i', '<C-L>', 'c<ESC>ddi')            -- Borrar línea
map('i', '<C-D>', 'c<ESC>dwi')             -- Borrar palabra (mantiene modo)
map('i', '<S-Insert>', '<C-R>+')           -- Pegar desde portapapeles
map('c', '<S-Insert>', '<C-R>+')
map('n', '<S-Insert>', '"+P')              -- Pegar en modo normal

-- Navegación
map({'n', 'v', 'i'}, '<C-a>', '<cmd>NvimTreeToggle<CR>', { silent = true })  -- Toggle árbol
map({'n', 'v'}, '<C-k>', '<cmd>cd %:p:h<CR>', { silent = true })              -- Ir a directorio del archivo

-- Indentación
map({'n', 'v'}, '<C-S-F4>', '<cmd>set expandtab ts=4 sw=4 ai<CR>', { silent = true })  -- 4 espacios
map('i', '<C-S-F4>', '<ESC><cmd>set expandtab ts=4 sw=4 ai<CR>a', { silent = true })
map({'n', 'v'}, '<C-S-F2>', '<cmd>set expandtab ts=2 sw=2 ai<CR>', { silent = true })  -- 2 espacios
map('i', '<C-S-F2>', '<ESC><cmd>set expandtab ts=2 sw=2 ai<CR>a', { silent = true })

-- Ejecutar
map({'n', 'v'}, '<C-S-b>', '<cmd>!python3 %<CR>', { silent = true })  -- Ejecutar Python

-- Portapapeles
map('v', '<C-c>', 'y', { noremap = true })  -- Copiar

-- Tagbar
map('n', '<F8>', '<cmd>TagbarToggle<CR>')

-- Zoom de fuente para Neovide
if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0
  local function adjust_zoom(amount)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + amount
  end
  map('n', '<C-S-F12>', function() adjust_zoom(0.1) end, { silent = true })
  map('n', '<C-S-F11>', function() adjust_zoom(-0.1) end, { silent = true })
  map('n', '<C-S-F10>', function() vim.g.neovide_scale_factor = 1.0 end, { silent = true })
end

-- ==========================================================================
-- 5. AUTOCOMANDOS
-- ==========================================================================
local api = vim.api
local user_augroup = api.nvim_create_augroup('UserConfig', { clear = true })

-- Omnifunc (autocompletado nativo) por lenguaje
local omnifuncs = {
  python   = 'v:lua.vim.lsp.omnifunc',
  javascript = 'javascriptcomplete#CompleteJS',
  html     = 'htmlcomplete#CompleteTags',
  markdown = 'htmlcomplete#CompleteTags',
  css      = 'csscomplete#CompleteCSS',
  xml      = 'xmlcomplete#CompleteTags'
}

for ft, func in pairs(omnifuncs) do
  api.nvim_create_autocmd('FileType', {
    group = user_augroup,
    pattern = ft,
    command = 'setlocal omnifunc=' .. func
  })
end

-- Archivos HTML de Django
api.nvim_create_autocmd('FileType', {
  group = user_augroup,
  pattern = 'html',
  command = 'setlocal ft=htmldjango.html'
})

-- Sin swapfile para carpetas montadas con GVFS
api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  group = user_augroup,
  pattern = '/run/user/1000/gvfs/*',
  command = 'setlocal noswapfile'
})

-- Easymotion
vim.g.EasyMotion_do_mapping = 0
vim.keymap.set({'n', 'v', 'o'}, '/', '<Plug>(easymotion-sn)')
vim.keymap.set('n', 'n', '<Plug>(easymotion-next)')
vim.keymap.set('n', 'N', '<Plug>(easymotion-prev)')

-- Wakatime
local wakatime_binary = vim.fn.expand('$HOME/.wakatime/wakatime-cli')                                                     
if vim.fn.executable(wakatime_binary) == 1 then                                                                           
 vim.g.wakatime_binary = wakatime_binary                                                                                 
end
