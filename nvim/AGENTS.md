# Neovim Config

Single-file configuration (`init.lua`) managed with lazy.nvim.

## Structure (239 lines)

| Section | Lines | Description |
|---------|-------|-------------|
| Base options | 4-40 | UI, indentación (2 espacios), portapapeles, fuente |
| lazy.nvim bootstrap | 49-57 | Auto-instala plugin manager si no existe |
| Plugin list | 63-158 | 15 plugins |
| Keymaps | 164-199 | Atajos personalizados |
| Autocmds | 205-239 | Omnifunc, Django HTML, GVFS fix |

## Plugins

| Plugin | Purpose | Key Shortcut |
|--------|---------|--------------|
| badwolf | Tema (dark) | - |
| nvim-tree.lua | Explorador archivos | `<C-a>` toggle |
| lualine.nvim | Status bar | - |
| gitsigns.nvim | Indicadores git | `<leader>hp` preview, `<leader>hb` blame |
| vim-fugitive | Comandos git | - |
| vim-visual-multi | Múltiples cursores | - |
| vim-easymotion | Movimiento rápido | - |
| tagbar | Tags símbolos | `:TagbarToggle` |
| emmet-vim | Abreviaciones HTML | `<C-y>,` |
| tabular | Alineación código | `:Tabularize /pattern` |
| LuaSnip | Snippets | - |
| indent-blankline.nvim | Líneas indentación | - |
| nvim-autopairs | Autocierre paréntesis | - |
| wakatime/vim-wakatime | Métricas coding | - |

## Keymaps

| Shortcut | Action |
|----------|--------|
| `<C-a>` | Toggle NvimTree |
| `<C-k>` | Cambiar a directorio del archivo |
| `<C-S-F2>` | Indentación 2 espacios |
| `<C-S-F4>` | Indentación 4 espacios |
| `<C-S-b>` | Ejecutar Python (`python3 %`) |
| `<C-BS>` (insert) | Borrar palabra |
| `<S-Insert>` | Pegar del portapapeles |
| `<C-S-F11/F12>` (Neovide) | Zoom fuente |

## Autocmds

- **Omnifunc**: Configurado para python, js, html, markdown, css, xml
- **Django**: Archivos HTML usan `ft=htmldjango.html`
- **GVFS**: Archivos en `/run/user/1000/gvfs/*` sin swapfile

## Workflows

- **Sync plugins**: `:Lazy sync`
- **LuaSnip build**: `make install_jsregexp` después de actualizar (line 148)
- **Verificar config**: `:lua vim.opt.number`

## Paths

- Config: `~/.config/nvim/init.lua`
- Lockfile: `~/.config/nvim/lazy-lock.json`
- lazy.nvim: `~/.local/share/nvim-data/lazy/`