package main // import "github.com/bvberkum/x-ci"

import (
	"os"
	"fmt"
)

var version = "0.0.1-dev" // x-ci

func main() {
  fmt.Println("Hello world, this is x-ci/main process", os.Getpid())
}
