package main // import "github.com/bvberkum/x-ci"

import (
	"os"
	"fmt"
)

var version = "0.1.0" // x-ci

func main() {
  fmt.Println("Hello world, this is a x-ci/main.go", version, "process", os.Getpid())
}
