# Neovim Configuration

> My Neovim Configuration file inspired by [ThePrimeagen](https://github.com/ThePrimeagen)

## Requirement

- [Neovim ^0.7](https://neovim.io/)

## Setup Guide

1. Remove or backup previous nvim Configuration

2. Clone this repository

- Windows

  ```sh
  git clone https://github.com/hwhang0917/nvim.git %APPDATA%/nvim
  ```

- MacOS

  ```sh
  git clone https://github.com/hwhang0917/nvim.git ~/.config/nvim
  ```

3. Install [Packer.nvim](https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart)

4. Open `lua/runfridge/packer.lua`

5. Execute `:so` then `:PackerSync`
