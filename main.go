package main // import "github.com/dotmpe/x-ci"

import (
	"os"
	"fmt"
)

var version = "0.1.3" // x-ci

func main() {
  fmt.Println("Hello world, this is a x-ci/main.go", version, "process", os.Getpid())
}
