.PHONY: help install serve build doctor clean docker-up docker-down docker-logs docker-restart

JEKYLL_HOST ?= 0.0.0.0
JEKYLL_PORT ?= 4000

# Prefer Docker Compose v2 (`docker compose`), fall back to v1 (`docker-compose`).
COMPOSE := $(shell command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1 && echo "docker compose" || echo "docker-compose")

help:
	@echo "Targets:"
	@echo "  install         Install Ruby gems (Bundler)"
	@echo "  serve           Run Jekyll locally (host=$(JEKYLL_HOST), port=$(JEKYLL_PORT))"
	@echo "  build           Build site into _site/"
	@echo "  doctor          Run Jekyll diagnostics"
	@echo "  clean           Remove build/cache outputs"
	@echo "  docker-up       Build + start via docker-compose (port 4000)"
	@echo "  docker-down     Stop docker-compose services"
	@echo "  docker-logs     Tail docker-compose logs"
	@echo "  docker-restart  Restart docker-compose services"

install:
	bundle install

serve:
	bundle exec jekyll serve --host "$(JEKYLL_HOST)" --port "$(JEKYLL_PORT)"

build:
	bundle exec jekyll build

doctor:
	bundle exec jekyll doctor

clean:
	rm -rf _site .sass-cache .jekyll-cache .jekyll-metadata

docker-up:
	$(COMPOSE) up -d --build

docker-down:
	$(COMPOSE) down

docker-logs:
	$(COMPOSE) logs -f

docker-restart: docker-down docker-up
