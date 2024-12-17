**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1. Lazyvim starter https://github.com/LazyVim/sts nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Prerequisite

Nvim >= v0.10

For linux users, if you install by `sudo apt install neovim`, please remove by `sudo apt remove neovim` and following this instructure:

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

Then add this to your shell config (~/.bashrc, ~/.zshrc, ...):

```
export PATH="$PATH:/opt/nvim-linux64/bin"
```

Then, install some require libs

```
sudo apt-get install ripgrep
```

```
sudo apt install yazi
```
