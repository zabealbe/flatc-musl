# flatc-musl
Flatc compiler script using musl


## Automatic build
Every Sunday a GitHub action will be triggered and the [flatbuffers repo](https://github.com/google/flatbuffers) will be checked for a newer version.
If a new version is found it will be built automatically.\
The resulting binary executable can be found under `versions/` directory with the format `flatc_{version}`.
