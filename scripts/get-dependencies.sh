#!/usr/bin/env bash

function get_dependencies() {
  cd .tools || exit

  declare -a packages=(
    "golang.org/x/tools/cmd/cover/..."
    "github.com/mattn/goveralls/..."
    "github.com/Bubblyworld/gogroup/..."
    "golang.org/x/lint/golint"
    "github.com/kisielk/errcheck"
    "honnef.co/go/tools/cmd/staticcheck"
    "github.com/client9/misspell/cmd/misspell"
    "mvdan.cc/unparam"
    "golang.org/x/tools/cmd/stringer"
    "github.com/go-bindata/go-bindata/v3/..."
    "mvdan.cc/gofumpt/..."
  )

  ## now loop through the above array
  for pkg in "${packages[@]}"; do
    echo "$pkg"
    go get -u -v "$pkg"
  done

  curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b $(go env GOPATH)/bin

  cd - || exit
}

echo Gonna to update go tools and packages...
get_dependencies
echo All is done!
