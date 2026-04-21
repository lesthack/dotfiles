# Neovim Config

Configuración personal de Neovim gestionada con [lazy.nvim](https://github.com/folke/lazy.nvim).

## Estructura

- `init.lua` — Archivo único con toda la configuración (220 líneas)
- `lazy-lock.json` — Lockfile de plugins
- `AGENTS.md` — Notas para agentes (documentación técnica)

## Secciones de init.lua

| # | Sección | Líneas | Descripción |
|---|---------|--------|-------------|
| 1 | Opciones base | 4-30 | UI, indentación, portapapeles, fuente |
| 2 | Bootstrap lazy.nvim | 38-46 | Auto-instala el gestor de plugins |
| 3 | Plugins | 51-130 | 14 plugins instalados |
| 4 | Atajos de teclado | 135-173 | Mapeos personalizados |
| 5 | Autocommands | 177-211 | Lógica por lenguaje |

## Plugins

| Plugin | Propósito |
|--------|-----------|
| [badwolf](https://github.com/sjl/badwolf) | Tema oscuro |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | Explorador de archivos |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Barra de estado |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Indicadores git |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Comandos git |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Múltiples cursores |
| [vim-easymotion](https://github.com/easymotion/vim-easymotion) | Movimiento rápido |
| [tagbar](https://github.com/preservim/tagbar) | Tags de funciones/clases |
| [emmet-vim](https://github.com/mattn/emmet-vim) | Abreviaciones HTML |
| [tabular](https://github.com/godlygeek/tabular) | Alineación de código |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippets (vscode format) |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Guías de indentación |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-cierre de paréntesis |
| [wakatime/vim-wakatime](https://github.com/wakatime/vim-wakatime) | Métricas de codificación |

## Atajos de Teclado

### Edición (modo inserción)
| Atajo | Acción |
|-------|--------|
| `<C-BS>` | Borrar palabra |
| `<C-L>` | Borrar línea |
| `<C-D>` | Borrar palabra (mantiene modo) |
| `<S-Insert>` | Pegar desde portapapeles |

### Navegación
| Atajo | Acción |
|-------|--------|
| `<C-a>` | Toggle NvimTree |
| `<C-k>` | Cambiar al directorio del archivo |
| `/` | EasyMotion (búsqueda rápida) |
| `n` / `N` | Siguiente/anterior match de EasyMotion |

### Multi-cursor (vim-visual-multi)
| Atajo | Acción |
|-------|--------|
| `<C-n>` | Siguiente coincidencia |
| `<C-p>` | Coincidencia anterior |
| `<C-d>` | Seleccionar línea abajo |

### Indentación
| Atajo | Acción |
|-------|--------|
| `<C-S-F2>` | 2 espacios |
| `<C-S-F4>` | 4 espacios |

### Varios
| Atajo | Acción |
|-------|--------|
| `<C-S-b>` | Ejecutar Python (`python3 %`) |
| `<F8>` | Toggle Tagbar |
| `<C-S-F11/F12>` | Zoom fuente (Neovide) |

## Autocommands

- **Omnifunc**: Configurado para python, javascript, html, markdown, css, xml
- **Django**: Archivos HTML usan `ft=htmldjango.html`
- **GVFS**: Sin swapfile en `/run/user/1000/gvfs/*`

## Comandos Útiles

```vim
:Lazy sync       " Sincronizar plugins
:Lazy update      " Actualizar plugins
:lua vim.opt.number " Verificar configuración
```

## Instalación

1. Copiar `init.lua` a `~/.config/nvim/init.lua`
2. Copiar `lazy-lock.json` a `~/.config/nvim/lazy-lock.json` (opcional)
3. Abrir Neovim y esperar a que lazy.nvim instale los plugins
4. Ejecutar `:Lazy sync` si es necesario

## Requisitos

- Neovim >= 0.8
- Python 3 (`/usr/bin/python3`)
- Git (para clonar plugins)
- `make` (para compilar LuaSnip jsregexp)