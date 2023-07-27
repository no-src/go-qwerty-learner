package main

import (
	"flag"

	"github.com/no-src/go-qwerty-learner/internal/about"
	"github.com/no-src/go-qwerty-learner/internal/version"
	"github.com/no-src/go-qwerty-learner/server"
	"github.com/no-src/log"
)

func main() {
	defer log.Close()

	var (
		printVersion bool
		printAbout   bool
	)
	flag.BoolVar(&printVersion, "v", false, "print the version info")
	flag.BoolVar(&printAbout, "about", false, "print the about info")
	flag.Parse()

	if printVersion {
		version.PrintVersion("go-qwerty-learner")
		return
	}

	if printAbout {
		about.PrintAbout()
		return
	}
	server.Run()
}
