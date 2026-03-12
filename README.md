# Neovim Configuration

<a href="https://dotfyle.com/hwhang0917/nvim"><img src="https://dotfyle.com/hwhang0917/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/hwhang0917/nvim"><img src="https://dotfyle.com/hwhang0917/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/hwhang0917/nvim"><img src="https://dotfyle.com/hwhang0917/nvim/badges/plugin-manager?style=flat" /></a>

> My Neovim Configuration file inspired by [Andrew Courter](https://www.youtube.com/@ascourter) and [ThePrimeagen](https://www.youtube.com/ThePrimeagen)

## Requirement

- [Neovim ^0.11.1](https://neovim.io/)
- [Git ^2.49.0](https://git-scm.com/)
- [Node.js ^22.16.0](https://nodejs.org/en/)

## Setup Guide

1. Remove or backup previous nvim Configuration

2. Clone this repository

- Windows

  ```sh
  git clone https://github.com/hwhang0917/nvim.git %localappdata%/nvim
  ```

- Unix-Like

  ```sh
  git clone https://github.com/hwhang0917/nvim.git ~/.config/nvim
  ```

## Testing with Docker

You can test the configuration in a clean Arch Linux container without affecting your local setup.

```sh
docker compose run --rm nvim
```

First run installs system dependencies and bootstraps plugins. Subsequent runs are faster thanks to cached volumes.
