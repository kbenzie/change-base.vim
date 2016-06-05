# change-base.vim

A vim plugin to change the base of integer literals.

It provides a set of functions and mappings, outlined below, to quickly
translate between base systems in a form commonly used by programming languages.

<!-- TODO: Screencast !-->

## Installation

#### [vim-plug](https://github.com/junegunn/vim-plug)

Add the following to your `.vimrc`.

```
Plug 'kbenzie/chang-base.vim'
```

#### [Vundle](https://github.com/VundleVim/Vundle.vim)

Add the following to your `.vimrc`.

```
Plugin 'kbenzie/change-base.vim'
```

#### [Pathogen](https://github.com/tpope/vim-pathogen)

```
git clone https://github.com/kbenzie/change-base.vim ~/.vim/bundle/change-base
```

## Functions

Six VIM functions are provided to convert between base 2, 8, 10, and 16. The
following table outlines these functions and the output they will generate using
the default configuration.

| Function        | Output     |
| :-------------: | :--------: |
| `Hex(42)`       | `0x2a`     |
| `HEX(0B101010)` | `0X2A`     |
| `Oct(0x2a)`     | `052`      |
| `Dec(0b101010)` | `42`       |
| `Bin(052)`      | `0b101010` |
| `BIN(0X2A)`     | `0B101010` |

The suggested method of using these functions directly is, whilst in insert
mode, to paste from the expression register. An example of pasting the
hexadecimal for of the number `42` is to type the following sequence of keys.

```vim
<C-r>=Hex(42)<CR>
```

This will paste `0x2a` at the current cursor position and return to insert mode
ready to resume editing.

## Mappings

A matching set of normal mode mappings are also provided to change the base of
existing integer literals. These mappings are customizable and can be changed be
setting the global variables below in your `.vimrc` file.

The default mappings follow the pneumonic `change` `base`
`{hexadecimal,octal,decimal,binary}` with upper case variants for hexadecimal
and binary.

| Setting                 | Default Mapping |
| :---------------------: | :-------------: |
| `g:change_base_map_Hex` | `<leader>cbh`   |
| `g:change_base_map_HEX` | `<leader>cbH`   |
| `g:change_base_map_Oct` | `<leader>cbo`   |
| `g:change_base_map_Dec` | `<leader>cbd`   |
| `g:change_base_map_Bin` | `<leader>cbb`   |
| `g:change_base_map_BIN` | `<leader>cbB`   |

An example of overriding the default mapping for `Bin` to use `,` instead of
`<leader>` place the following in your `.vimrc` file and the mapping will set up
accordingly.

```vim
let g:change_base_map_Bin = ',cbb'
```

The mappings are created using the pattern below, simplified for readability.
First using the change operator `c` and the inner word `iw` text object, the
current word is yanked to the `"` register. Now from insert mode we paste
`<C-r>` the expression register `=` ready to evaluate an expression, the
expression we will evaluate is a call to the `Dec` function, as described above.
The function parameter is determined by pasting `<C-r>` the value of the `"`
register, the command is then executed `<CR>` and finally we return to normal
mode `<ESC>`.

```vim
nnoremap <leader>cbd ciw<C-r>=Dec(<C-r>")<CR><ESC>'
```

All mappings can be disabled by setting this options in your `.vimrc` file, the
default is `1`.

```vim
let g:change_base_enable_mappings = 0
```

## License (MIT)

Copyright © `2016` `Kenneth Benzie`

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
