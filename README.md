# dotfiles

> Because life's too short to manually setup my machine

# get started

1. Install/Boot new machine, run through mac setup
2. run `git --version`. This will trigger a prompt to install xcode command line tools
3. Install/agree to xcode command line tools
4. Replace links to private fonts in [./setup.sh](/setup.sh) with live URLs from dropbox.com
5. run from home directory:

```bash
mkdir dev && cd dev && git clone https://github.com/tay1orjones/dotfiles.git && cd dotfiles && sh setup.sh
```

## Acknowledgements

Inspiration and code was taken from many sources, including:

- @alrra (Cãtãlin Mariş) https://github.com/alrra/dotfiles
- @mathiasbynens (Mathias Bynens) https://github.com/mathiasbynens/dotfiles
- @paulirish (Paul Irish) https://github.com/paulirish/dotfiles
