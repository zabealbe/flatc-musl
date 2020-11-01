# flatc-musl
Flatc compiler script using musl


## Automatic build with GitHub Actions
Every Sunday a GitHub action will be triggered and the [flatbuffers repo](https://github.com/google/flatbuffers) will be checked for a newer version.
If a new version is found it will be built automatically.\
The resulting binary executable can be found under `versions/` directory with the format `flatc_{version}`.

:open_file_folder: project root\
  └ :open_file_folder: [versions](versions)\
  &nbsp;&nbsp;&nbsp;&nbsp;└:gear: flatc_{version}
