package main

import (
	"github.com/no-src/fserver"
	"github.com/no-src/go-qwerty-learner/internal/about"
	"github.com/no-src/go-qwerty-learner/internal/version"
	"github.com/no-src/go-qwerty-learner/webdist"
	"github.com/no-src/log"
)

func main() {
	defer log.Close()

	exit, port := fserver.InitFlag(func() {
		version.PrintVersion("go-qwerty-learner")
	}, about.PrintAbout)

	if exit {
		return
	}
	fserver.Run(port, "/build", webdist.WebDist)
}
