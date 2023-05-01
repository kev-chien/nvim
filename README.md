# Nvim Configs
My nvim configs.

Major credits to https://github.com/ajnassar/nvim

## Install steps:

After the first step, the following steps are not in any proven or fully correct order; some steps mayyyy be missing.

1. `git clone` this repo into your should be into your `~/.config`, so that you have a `~/.config/nvim/init.vim`
2. figure out what python path and what pip path to use
    - on el8 instance, use `let g:python3_host_prog = "/usr/bin/python"`
    - on mac, if `python3` installed, use `let g:python3_host_prog = "python3"`
    - use `pip3` which is linked to the python instance, to install the relevant packages
3. install [vim-plug](https://github.com/junegunn/vim-plug)
    - run `nvim`
    - run `:PlugInstall`
4. install [node>=12](https://nodejs.org/en/download) (for CoC)
5. install [fzf](https://github.com/junegunn/fzf)
    - mac: `brew install fzf`
        - To install useful key bindings and fuzzy completion:
        - `$(brew --prefix)/opt/fzf/install`
    - ubuntu: `sudo apt install fzf`
6. install [ag](https://github.com/ggreer/the_silver_searcher)
    - mac: `brew install the_silver_searcher`
7. install [ctags](https://github.com/universal-ctags/ctags)
    - mac: `brew install --HEAD universal-ctags/universal-ctags/universal-ctags`
    - ubuntu: `sudo apt install universal-ctags`
8. install [rg](https://github.com/BurntSushi/ripgrep)
    - mac: `brew install ripgrep`
    - ubuntu: `sudo apt install ripgrep`

## Debugging steps:
- Every time you modify your `init.vim`, you can run `:so` with that file open to reload the configs. Or, just restart `nvim`
- Run `:checkhealth` to see if nvim is complaining about anything, and to see specific diagnosed problems or steps to solve them

## Python-specific install steps:
1. install flake8 `pip install flake8`
2. install isort `pip install isort`
3. install [pynvim](https://github.com/neovim/pynvim)
    - `pip install pynvim`

## iTerm install steps:
1. Follow https://stackoverflow.com/a/46018502 to add the following iTerm mappings:
    - add `CMD-s`:  `:w!\n` (saves file)
    - add `CMD-/`: `gcc` (comments out code)
2. Install [Devicons font](https://github.com/ryanoasis/nerd-fonts#font-installation)
    - in OSX terminal: run `cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid Sans Mono Nerd Font Complete.otf`
    - in iTerm preferences: go to Profiles -> Text -> Font -> check "Use a different font for non-ASCII text → DroidSansMono Nerd Font"
    <!-- TODO: add screenshot -->
<img width="565" alt="Screen Shot 2022-04-11 at 12 29 41 PM" src="https://user-images.githubusercontent.com/20323625/229319844-5b69ab21-7b25-4535-8106-0d8dabcd98ed.png">

## Go install steps:
1. Make sure go >= 1.19 is installed on your machine
2. Make sure `go` and go binaries (e.g. `gopls`, after nivm installs it) can be accessed from your PATH.
    - You can add this to your `.bashrc` for el6:
        ```
        PATH=$PATH:/opt/golang1.19/bin
        PATH=$PATH:/home/vagrant/go/bin/
        ```
    - Generally, e.g. for mac, add this to your `.bash_profile`:
        ```
        PATH=$PATH:~/go/bin/
        ```
3. With `nvim` open, run `:GoUpdateBinaries`. You may need to restart `nvim` to see everything working.
   If everything was installed correctly, you should be able to see auto-completion and docstrings like these:
   <img width="1100" alt="Screen Shot 2023-05-01 at 11 28 37 AM" src="https://user-images.githubusercontent.com/20323625/235506872-7f916b21-ce73-4b9a-9a52-6e4056138265.png">
4. If you get this error: "Spawning language server with cmd: `gopls` failed. The language server is either not installed, missing from PATH, or not executable."
    - Revisit step 2: You'll need to make sure you can access `gopls` from your PATH
5. See [vim-go cheatsheet](https://gist.github.com/krlvi/d22bdcb66566261ea8e8da36f796fa0a)
6. Also read the vim-go section of the `init.vim` to see custom mappings

## Cool Commands this gives you

This is a list of commands you can use with these configs. Some of these come from base vim, but I threw them in here anyways.

NOTE: `C`: ctrl, `S`: shift

- `C-p` fzf
    - `C-t` new tab
    - `C-v` vertical split during fzf
    - `C-x` horizontal split during fzf
- `C-w-direction:` switch panes
- `space`-direction: also switch panes
- `space` 1, 2, n to choose tabs
- `C-S-Left`, `C-S-Right` to switch tabs left and right
- `:ag` to search for string in project
    - Using Rg, outdated: `(space-f` to search in project)
- `gcc`: comment
- `C-r`: redo
- `c-a-"`: change around ", etc.
- `ysiW-"`: add `"` around W
- `C-6` go between previous and next
- `space-=`, `space-minus` : increase pane size
- `space-w`: picks [nvim window](https://github.com/s1n7ax/nvim-window-picker), but doesn't work currently
- `*` highlight occurrences of word cursor is on/ go to next occurence
- `C-o` show most recently updated? opened? files
- `tab`, `S-tab`: indent + un-indent
- `[h` —> previous git hunk
- `]h` —> next git hunk
- `C-n` : multi-select
- `C-S-Down`: multi-cursor select down
- `C-S-Up`: multi-cursor select up
- `space-s:` git blame line
- `space-c:` in visual mode, copy text to OS clipboard
- tags:
    - `space-t` : generate tags
    - `C-}` : jump to tag (this is OP... sometimes)
- `gg=G` : auto-indents the whole file. This works... sometimes
