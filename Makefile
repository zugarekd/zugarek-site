.PHONY: dev build preview new

dev:
	npm run dev

build:
	npm run build

preview:
	npm run preview

new:
	@echo "Example: make new TITLE='My Project' CAT=embedded TAGS='esp32 hub75'"
	@./tools/new-project.sh "$${TITLE}" "$${CAT:-misc}" $${TAGS:-}
