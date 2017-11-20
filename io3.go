package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"sort"
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
	var list []string
	for _, file := range files {
		if file.Name()[0:1] != "." {
			list = append(list, file.Name())
		}
	}
	sort.Strings(list)
	for _, fn := range list {
		fmt.Printf("%s\n", fn)
	}
}
