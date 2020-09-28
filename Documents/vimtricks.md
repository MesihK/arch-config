# VIM Tricks

## Movement

* zz - move current line to the middle of the screen
* zt - move current line to the top of the screen
* zb - move current line to the bottom of the screen

* ctrl-y Moves screen up one line
* ctrl-e Moves screen down one line
* ctrl-u Moves cursor & screen up ½ page
* ctrl-d Moves cursor & screen down ½ page
* ctrl-b Moves screen up one page, cursor to last line
* ctrl-f Moves screen down one page, cursor to first line

## Variables

```
:let x=100
:let x=x+30
:put x - put x content to new line
:echo x

{insert mode}: ctrl+r =x - put x content at cursor position
```

## Misc

ZZ - if you happen to have Caps Lock on accidentally, you will save and exit vim

## Registers

* "{reg}dd - "xdd - put content of this line to register and also delete the line
* "{reg}p - "xp - put content of register to current cursor position

## Spell Check

* Move between errors `[s ]s`
* Fix them `z=`
* Add unknown word to dictionary `zg`
* `:set nospell` to disable checking

## Vimdiff

To avoid whitespace comparison:
:set diffopt+=iwhite

* ]c :        - next difference
* [c :        - previous difference
* do          - diff obtain
* dp          - diff put
* zo          - open folded text
* zc          - close folded text
* :diffupdate - re-scan the files for differences
* zr	    - open all folds
* zm	    - close all folds

## Latex Turkish Characters
* %s/ç/\\c\{c\}/g
* %s/Ç/\\c\{C\}/g
* %s/ğ/\\u\{g\}/g
* %s/Ğ/\\u\{G\}/g
* %s/ı/\{\\i\}/g
* %s/İ/\{\\.I\}/g
* %s/ü/\{\\"u\}/g
* %s/Ü/\{\\"U\}/g
* %s/ö/\{\\"o\}/g
* %s/Ö/\{\\"O\}/g
* %s/ş/\\c\{s\}/g
* %s/Ş/\\c\{S\}/g

## Upper lower case conversion

* Toggle case "HellO" to "hELLo" with g~ then a movement.
* Uppercase "HellO" to "HELLO" with gU then a movement.
* Lowercase "HellO" to "hello" with gu then a movement.


## Navigation with guides

If you add a guide such as <++> you can create a command that searches for that
an you can automatically jump there. For example you can jump with space+tab:
```
  inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
  vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
  map <Space><Tab> <Esc>/<++><Enter>"_c4l
```
Example commands for latex:
```
 autocmd FileType tex inoremap ,e \begin{equation}<Enter><Enter>\end{equation}<Enter><++><Esc>2kA
 autocmd FileType tex inoremap ,ea \begin{eqnarray}<Enter><Enter>\end{eqnarray}<Enter><++><Esc>2kA
 autocmd FileType tex inoremap ,sp \begin{split}<Enter><Enter>\end{split}<Enter><++><Esc>2kA
 autocmd FileType tex inoremap ,sa \begin{aligned}<Enter><Enter>\end{aligned}<Enter><++><Esc>2kA
 autocmd FileType tex inoremap ,se $$ <++><Esc>F$i
 autocmd FileType tex inoremap ,mb \mathbb{} <++><Esc>F}i
 autocmd FileType tex inoremap ,d \dot{} <++><Esc>F}i
 autocmd FileType tex inoremap ,dd \ddot{} <++><Esc>F}i
 autocmd FileType tex inoremap ,ddd \ddot{} <++><Esc>F}i
```
File Types for `FileType` command:
* tex
* gitcommit
* markdown
* rmd
* html
* bib

## Timeout for command recognition

250ms example
```
set timeout
set timeoutlen=250
set ttimeoutlen=100
```

## Clipboard

If vim compiled with clipboard option you can check with `vim --version`,
then you can use + register as clipboard.
use this commads as helper
```
	vnoremap <C-c> "+y
	map <C-p> "+P
```
