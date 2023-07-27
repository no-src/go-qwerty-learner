package about

import (
	"github.com/no-src/go-qwerty-learner/internal/version"
	"github.com/no-src/log"
)

const (
	openSourceUrl    = "https://github.com/no-src/go-qwerty-learner"
	documentationUrl = "https://pkg.go.dev/github.com/no-src/go-qwerty-learner@" + version.VERSION
	releaseUrl       = "https://github.com/no-src/go-qwerty-learner/releases"
	dockerImageUrl   = "https://hub.docker.com/r/nosrc/go-qwerty-learner"
)

// PrintAbout print the program logo and basic info
func PrintAbout() {
	log.Log("The go-qwerty-learner is a project that distributes qwerty-learner through a standalone binary file")
	log.Log("Open source repository at: <%s>", openSourceUrl)
	log.Log("Download the latest version at: <%s>", releaseUrl)
	log.Log("The docker image repository address at: <%s>", dockerImageUrl)
	log.Log("Full documentation at: <%s>", documentationUrl)
}
