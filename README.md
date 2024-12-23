# do

This is the `do` (Digital Ocean) image which contains some tools:

- `doctl`
- `jq`

## Usage

You need to have a `doctl` configuration file:  
- On linux the configuration file is located at `~/.config/doctl/config.yaml`.  
- On OSX the configuration file is located at `/Users/$USER/Library/Application Support/doctl/config.yaml`.

### Linux

```bash
docker run --rm -it -v $HOME/.config/doctl/config.yaml:/root/doctl/config.yaml ghcr.io/tracker-tv/do-amd64:latest
```

### OSX
```bash
docker run --rm -it -v /Users/$USER/Library/Application\ Support/doctl/config.yaml:/root/doctl/config.yaml ghcr.io/tracker-tv/do-arm64:latest
```
