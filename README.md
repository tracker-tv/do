# do

This is the Digital Ocean image, it's intended to be used as a helper image for CI/CD pipelines.

## Tools

- `jq`
- `git`
- `doctl`
- `kubectl`
- `helm`

## Usage

To use this image locally, you need to add your digital ocean access token as an environment variable.
For example, [doks](https://github.com/tracker-tv/doks/blob/main/bin/do#L13) repo use this image to deploy the k8s cluster to digital ocean and environment variable is set in the github secrets and when you run it locally you need to set `DIGITALOCEAN_ACCESS_TOKEN` environment variable to be able to interact with Digital Ocean api.


Edit your bash profile (~/.bashrc, ~/.zshrc, etc.) and add the following line:
```bash
export DIGITALOCEAN_ACCESS_TOKEN=ACCES_TOKEN
```
