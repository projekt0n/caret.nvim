![caret.nvim](https://github.com/projekt0n/caret.nvim/assets/24286590/558ae624-ad21-42c9-b5af-8d0663b44998)

**[WIP]** The timeless colorscheme for neovim text editor.

---

The primary focus of 'caret' colorscheme is to provide a user-friendly and visually pleasing coding color scheme for developers. This project was initiated during my pursuit of computer science education. Leveraging the rich heritage of my family's Bandhani (tie-dye textile) craftsmanship, spanning seven generations, I have seamlessly integrated this legacy of expertise into the creation of this colorscheme.

#### Sponsorware

After dedicating approximately 3 years to the development of caret.nvim, I am considering the option of offering it as sponsorware. This would enable users and organizations to contribute to the continued development, maintenance, and quicker release of upcoming versions, as well as potential ports. Your support would be greatly appreciated.

<!-- If you're interested, you can learn more about 'sponsor-spotlight' on
 https://dev.to/ful1e5/lets-give-recognition-to-those-supporting-our-work-on-github-sponsors-b00 -->

![shoutout-sponsors](https://sponsor-spotlight.vercel.app/sponsor?login=ful1e5)

## Features

- Supports the latest Neovim>=0.5 features like Treesitter and LSP
- Vim terminal colors
- Support for multiple [plugins](#supported-plugins)
  - And many others should 'just work'!
- Meticulously chosen colors for comfortable coding in various conditions
- Inclusive design aids colorblind and normal vision coders' visibility

## Requirements

- Neovim >= 0.8.0
- True color support
- Undercurl terminal support (optional)

## Installation

Install the theme with your preferred package manager:

Install with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'projekt0n/caret.nvim'
```

Or with [dein](https://github.com/Shougo/dein.vim):

```vim
call dein#add('projekt0n/caret.nvim')
```

Or with [minpac](https://github.com/k-takata/minpac):

```vim
call minpac#add('projekt0n/caret.nvim')
```

Or with [Packer.nvim](https://github.com/wbthomason/packer.nvim):

Add this in your `init.lua` or `plugins.lua`

```lua
-- Install without configuration
use ({ 'projekt0n/caret.nvim' })

-- Or with configuration
use({
  'projekt0n/caret.nvim',
  config = function()
    require('caret').setup({
      -- ...
    })

    vim.cmd('colorscheme caret')
  end
})
```

Or with [lazy.nvim](https://github.com/folke/lazy.nvim):

Add this in your `init.lua` or `plugins.lua`

```lua
-- Install without configuration
{ 'projekt0n/caret.nvim' }

-- Or with configuration
{
  'projekt0n/caret.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('caret').setup({
      -- ...
    })

    vim.cmd('colorscheme caret')
  end,
}
```

## Usage

Simply set the colorscheme with the builtin command `:colorscheme`

```vim
colorscheme caret
```

```lua
vim.cmd('colorscheme caret')
```

To use light theme set vim option `background` to `light`

```vim
set background=light
```

```lua
vim.o.background = 'light'
```

## Screenshots

- Font:
  [Iosevka Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)
- Terminal:
  [kitty](https://sw.kovidgoyal.net/kitty)
- Icon:
  [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- StatusLine: Default
  ([.vimrc](https://github.com/ful1e5/dotfiles/blob/main/nvim/.config/nvim/lua/ful1e5/statusline.lua))
- dotfiles:
  [ful1e5/dotfiles/nvim](https://github.com/ful1e5/dotfiles/tree/main/nvim/.config/nvim)

### Caret Dark

```lua
vim.o.background = 'dark'
vim.cmd('colorscheme caret')
```

![caret_dark](https://github.com/projekt0n/caret.nvim/assets/24286590/dadb52aa-dba6-45be-a8c3-16780900af45)

### Caret Light

```lua
vim.o.background = 'light'
vim.cmd('colorscheme caret')
```

![caret_light](https://github.com/projekt0n/caret.nvim/assets/24286590/3cf638c7-76dd-444f-9097-9f8fa721917e)

## Supported Plugins

- [Builtin lsp diagnostics](https://neovim.io/doc/user/lsp.html)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [circles.nvim](https://github.com/projekt0n/circles.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

## TODO

- [ ] Supports more plugins
- [ ] Enhance syntax highlights
- [ ] Port to others
- [ ] Generate Syntax colors using AI to enhance the code visibility per file and file format

## Copying

This project is released under the terms of the MIT license.

See [LICENCE](./LICENSE) for more information or see [opensource.org](https://opensource.org/licenses/MIT)
