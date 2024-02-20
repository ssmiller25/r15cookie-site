# Steve Miller's Personal Blog

[![Netlify Status](https://api.netlify.com/api/v1/badges/4dee8665-200d-43f2-8d9e-c1749b1e82ad/deploy-status)](https://app.netlify.com/sites/r15cookieblog/deploys)

## Local Env Work

Make sure to run
```sh
git submodule update --init --recursive
```
on the first pull of the repo to pull the submodule

To update submodules

```sh
git submodule update --remote --merge
```

## Local Build

To test and run locally:

```sh
make build   # Build latest docker container
make run     # Run that container locally
make push    # Push the container up (mostly for me...)
```