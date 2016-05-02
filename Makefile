SHELL:=/bin/bash
VERSION:=0.3
IMAGE=corneti/next-action:$(VERSION)

build:
	@docker build -t $(IMAGE) .

run: build
	@docker stop next-action && docker rm next-action || echo
	@docker run -e "TODOIST_APIKEY=bogus" --rm --name=next-action $(IMAGE)

publish: build
	@docker push $(IMAGE)
