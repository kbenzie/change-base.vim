" Author: Kenneth Benzie <k.benzie83@gmail.com>
" Description: Change the base of an integer literal.
" Version: 1.0.0
" License: MIT

" Initialize {{{
if exists('g:loaded_change_base') || &cp
  finish
endif
let g:loaded_change_base = 1
" }}}

" Options {{{
let g:change_base_map_Hex = get(g:, 'change_base_map_Hex', '<leader>cbh')
let g:change_base_map_HEX = get(g:, 'change_base_map_HEX', '<leader>cbH')
let g:change_base_map_Oct = get(g:, 'change_base_map_Oct', '<leader>cbo')
let g:change_base_map_Dec = get(g:, 'change_base_map_Dec', '<leader>cbd')
let g:change_base_map_Bin = get(g:, 'change_base_map_Bin', '<leader>cbb')
let g:change_base_map_BIN = get(g:, 'change_base_map_BIN', '<leader>cbB')
let g:change_base_enable_mappings = get(g:, 'change_base_enable_mappings', 1)
" }}}

" Mappings {{{
if g:change_base_enable_mappings
  execute 'nnoremap '.g:change_base_map_Hex.' ciw<C-r>=Hex(<C-r>")<CR><ESC>'
  execute 'nnoremap '.g:change_base_map_HEX.' ciw<C-r>=HEX(<C-r>")<CR><ESC>'
  execute 'nnoremap '.g:change_base_map_Oct.' ciw<C-r>=Oct(<C-r>")<CR><ESC>'
  execute 'nnoremap '.g:change_base_map_Dec.' ciw<C-r>=Dec(<C-r>")<CR><ESC>'
  execute 'nnoremap '.g:change_base_map_Bin.' ciw<C-r>=Bin(<C-r>")<CR><ESC>'
  execute 'nnoremap '.g:change_base_map_BIN.' ciw<C-r>=BIN(<C-r>")<CR><ESC>'
endif
" }}}

" Functions {{{
function! Hex(num)
  return printf('0x%x', a:num)
endfunction

function! HEX(num)
  return printf('0X%X', a:num)
endfunction

function! Dec(num)
  return a:num
endfunction

function! Oct(num)
  return printf('0%o', a:num)
endfunction

function! Bin(num)
  return '0b'.s:bin(a:num)
endfunction

function! BIN(num)
  return '0B'.s:bin(a:num)
endfunction

function! s:bin(num)
  let l:hex = printf('%x', a:num)
  let l:index = 0
  let l:bin = ''
  while l:index < len(l:hex)
    " We don't insert leading 0's so ignore 0.
    if '1' == l:hex[l:index]
      let l:bin = l:bin.'1'
    elseif '2' == l:hex[l:index]
      let l:bin = l:bin.'10'
    elseif '3' == l:hex[l:index]
      let l:bin = l:bin.'11'
    elseif '4' == l:hex[l:index]
      let l:bin = l:bin.'100'
    elseif '5' == l:hex[l:index]
      let l:bin = l:bin.'101'
    elseif '6' == l:hex[l:index]
      let l:bin = l:bin.'110'
    elseif '7' == l:hex[l:index]
      let l:bin = l:bin.'111'
    elseif '8' == l:hex[l:index]
      let l:bin = l:bin.'1000'
    elseif '9' == l:hex[l:index]
      let l:bin = l:bin.'1001'
    elseif 'a' == l:hex[l:index]
      let l:bin = l:bin.'1010'
    elseif 'b' == l:hex[l:index]
      let l:bin = l:bin.'1011'
    elseif 'c' == l:hex[l:index]
      let l:bin = l:bin.'1100'
    elseif 'd' == l:hex[l:index]
      let l:bin = l:bin.'1101'
    elseif 'e' == l:hex[l:index]
      let l:bin = l:bin.'1110'
    elseif 'f' == l:hex[l:index]
      let l:bin = l:bin.'1111'
    endif
    let l:index += 1
  endwhile
  return l:bin
endfunction
" }}}
