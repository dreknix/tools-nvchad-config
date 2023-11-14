# Config for Neovim/NvChad

Custom config for Neovim/NVChad.

## Install

```console
git clone git@github.com:dreknix/tools-nvchad-config.git ~/.config/nvim/lua/custom
```

Add link from `~/.config/nvim/after` to `~/.config/nvim/lua/custom/after`.

```console
ln -s ~/.config/nvim/lua/custom/after/ ~/.config/nvim/after
```

Update all special `spl` files:

```console
nvim -c 'silent mkspell! % | q!' ~/.config/nvim/after/spell/computer-science
```

## Documentation

A detailed documentation of the custom config for NvChad can be found in the
[wiki](https://dreknix.github.io/wiki/tools/neovim/index.html#custom-config).

## License

[MIT](https://github.com/dreknix/tools-nvchad-config/blob/main/LICENSE)
