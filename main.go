package main

import (
	"log"
	"os"
)

func main() {
	err := os.Mkdir("timezones", 0755)
	if err != nil {
		log.Fatal(err)
	}
}
