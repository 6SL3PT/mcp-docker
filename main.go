package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"github.com/6sl3pt/mcp-go-cli/cmd"
)

var version = "debug"

func main() {
	for {
		fmt.Print("Enter model: ")
		model, _ := bufio.NewReader(os.Stdin).ReadString('\n')

		model = strings.TrimSpace(model)

		os.Args = append(os.Args, "-m", model)

		cmd.Execute()
	}
}
