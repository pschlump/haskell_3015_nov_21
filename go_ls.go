package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	if len(os.Args) > 1 {
		for _, s := range os.Args[1:] {
			ls(s)
		}
	} else {
		ls(".")
	}
}

func ls(dir string) {
	files, err := ioutil.ReadDir(dir)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error opeing directory, %s\n", err)
		os.Exit(1)
	}

	for _, file := range files {
		fmt.Printf("%s\n", file.Name())
	}
}
