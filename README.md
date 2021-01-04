# action-ktlint-setup
GitHub Action to install ktlint for use in a workflow.

## Inputs

### ktlint_version
_Optional_: You can pass [a verson of ktlint](https://github.com/pinterest/ktlint/tags) to install. Defaults to `"latest"`

## Example Usage
```yml
on:
  pull_request:
    paths:
      - "**/*.kt"

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: "Install ktlint"
      uses: nbadal/action-ktlint-setup@v1
      with:
        ktlint_version: '0.40.0'

    - run: ktlint --version
      shell: bash
```
