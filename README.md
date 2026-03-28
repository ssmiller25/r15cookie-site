# Steve Miller's Personal Blog

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
