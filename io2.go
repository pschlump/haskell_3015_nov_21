package main

import (
	"fmt"
	"os"
)

func main() {
	for _, s := range os.Args[1:] {
		fmt.Printf("%s ", s)
	}
	fmt.Printf("\n")
}
