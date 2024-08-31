# my beloved vim
config heavily based on the primeagen's ["0 to lsp: neovim rc from scratch" video](https://www.youtube.com/watch?v=w7i4amO_zaE)

requires neovim 0.9 or higher.

this script is not optimized, there might be some redundancy.

lsp-zero seems to not be needed, as stated in [lsp-zero.nvim blog](https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html)

from netrw
```text
% to create a new file
d to create a directory
:Ex open netrw from file
:so source the current file

remaps
_pv opens netrw
_pf opens telescope
Ctrl+p opens telescope at git files
_ps ripgreps occurrence of text
_a [harpoon] add mark to file
Ctrl+e [harpoon] open quick menu
Ctrl+[hjkl] [harpoon] quick switch between files
```

## remaps
```text
_pv opens Explore

J [visual] moves code block up, plus auto indent
K [visual] moves code block down, plus auto indent

J bring the line below to  the same line, keeping cursor in place
<C-d> move half a page down keeping the cursor in the middle
<C-u> move half a page up keeping the cursor in the middle

_p pastes without copying the removed selection into the paste buffer

_y yankees at system clipboard

_d deletes into the void register

_s replace ocurrence of _word_ under the whole file

```
