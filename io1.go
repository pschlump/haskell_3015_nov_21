package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	fmt.Printf("Some Input Please? ")
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	line := scanner.Text()
	fmt.Printf("Echo of ->%s<-\n", line)
}
