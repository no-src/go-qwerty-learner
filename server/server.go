package server

import (
	"net/http"
	"os/exec"
	"runtime"
	"time"

	"github.com/no-src/go-qwerty-learner/server/dist"
	"github.com/no-src/log"
)

func Run() {
	addr := ":9097"
	url := "http://127.0.0.1" + addr
	var err error
	log.Log("start web server => %s", url)
	go func() {
		time.Sleep(time.Second)
		if err == nil {
			log.ErrorIf(openBrowser(url), "open url error => %s", url)
		}
	}()
	err = log.ErrorIf(http.ListenAndServe(addr, fsPrefix("/build", http.FileServer(http.FS(dist.WebDist)))), "start web server error")
}

type fsPrefixHandler struct {
	prefix  string
	handler http.Handler
}

func (h *fsPrefixHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	r.URL.Path = h.prefix + r.URL.Path
	h.handler.ServeHTTP(w, r)
}

func fsPrefix(prefix string, handler http.Handler) http.Handler {
	return &fsPrefixHandler{
		prefix:  prefix,
		handler: handler,
	}
}

func openBrowser(url string) (err error) {
	switch runtime.GOOS {
	case "windows":
		err = exec.Command("cmd", "/c", "start", url).Start()
	case "darwin":
		err = exec.Command("open", url).Start()
	case "linux":
		err = exec.Command("xdg-open", url).Start()
	}
	return err
}
