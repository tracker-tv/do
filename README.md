# do

This is the `do` (Digital Ocean) image which contains some tools:

- `doctl`
- `jq`

## Usage

### Linux

```bash
docker run --rm -it -v $HOME/.config/doctl/config.yaml:/root/doctl/config.yaml -v $(pwd):/workdir -w /workdir ghcr.io/philips-labs/do:latest doctl
```

### OSX
```bash
docker run --rm -it -v /Users/$USER/Library/Application\ Support/doctl/config.yaml:/root/doctl/config.yaml do:0.0.1
```
