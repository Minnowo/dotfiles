
## Requirements

```sh
pacman -S stow git
```

## Installation

Clone the repo:
```sh
git clone https://github.com/minnowo/dotfiles .files
cd .files
```

Then use GNU Stow to create symlinks:
```sh
stow .
```

Assuming you have conflicting files, you can adopt them:
```sh
stow --adopt .
```

This will update the repo contents with your conflicting files.
You can then stash your changes to fully apply these ones:
```sh
git stash
```

