package main // import "github.com/bvberkum/x-ci"

import (
	"os"
	"fmt"
)

var version = "0.0.4-dev" // x-ci

func main() {
  fmt.Println("Hello world, this is a x-ci/main.go", version, "process", os.Getpid())
}
