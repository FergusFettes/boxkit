# Fergus Fettes Boxkit

Plan is to use boxkits for terminal environments so I don't get lost so often.

# Original README

See [here](https://github.com/ublue-os/boxkit) for original README.

- Starts with the latest Alpine image from the [Toolbx Community Images](https://github.com/toolbx-images/images)
- Adds some quality of life
    - `starship` prompt for that <3
    - `just` for task execution
    - `chezmoi` for dotfile management
    - `btop` for process management
    - `micro` and `helix` text editors
    - [clipboard](https://github.com/Slackadays/Clipboard) to cut, copy, and paste anything, anywhere, all from the terminal! 
    - `python3` 
    - Some common power tools: `plocate`, `fzf`, `cosign`, `ripgrep`, `github-cli`, and `ffmpeg`
    - [zellij](https://github.com/zellij-org/zellij) - terminal workspace
    - [direnv](https://direnv.net/) - environment variable extension for your shell 
    - [atuin](https://github.com/ellie/atuin) - magical shell history
    - Host Management QoL
        - These are meant for occasional one off commands, not complex workflows
        - Auto symlink the flatpak, podman, and docker commands
        - Auto symlink rpm-ostree for Fedora
        - Auto symlink transactional-update for openSUSE MicroOS

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/ublue-os/boxkit -n boxkit
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/ublue-os/boxkit -c boxkit
    toolbox enter boxkit

### Pull down your config

Use `chezmoi` to pull down your dotfiles and set up git sync.


## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ublue-os/boxkit
    
## TODO:

Shove everything from [Modern UNIX](https://github.com/ibraheemdev/modern-unix) in there and it's going to look like a glitter explosion. 
