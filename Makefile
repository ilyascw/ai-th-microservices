DRAWIO := .tools/draw.io.app/Contents/MacOS/draw.io
SCHEME := Microservices.drawio
PNG := $(SCHEME:.drawio=.png)

.PHONY: png renderer

png: $(PNG)

renderer:
	./scripts/install-deps.sh

$(PNG): $(SCHEME) | renderer
	"$(DRAWIO)" --export --format png --output "$@" "$<"
