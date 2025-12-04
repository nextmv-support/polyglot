# Rust echo app

A simple echo app written in Rust.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Rust](https://www.rust-lang.org/tools/install)

## Usage

Push the app to the platform:

```bash
nextmv app push -a <app-id>
```

Run the app remotely:

```bash
echo '{"hello": "world"}' | nextmv app run -a <app-id>
```
