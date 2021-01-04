# action-ktlint-setup
GitHub Action to install ktlint

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
        ktlint_version: 'latest'

    - run: ktlint --version
      shell: bash
```
