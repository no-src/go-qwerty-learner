package webdist

import "embed"

// WebDist the web dist resource
//
//go:embed build
var WebDist embed.FS
