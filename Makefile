build-app:
	docker build \
		--tag custom-npm \
		.

create-nuxt-app:
	make build-app
	docker run \
		--rm \
		--tty \
		--interactive \
		--volume $(PWD):/app \
		--workdir /app \
		--user $(shell id -u):$(shell id -g) \
		custom-npm yarn create nuxt-app ${PROJECT_NAME}

npm-add-package:
	make build-app
	docker run \
		--rm \
		--tty \
		--interactive \
		--volume $(PWD)/share_book:/app \
		--workdir /app \
		--user $(shell id -u):$(shell id -g) \
		custom-npm npm install ${PACKAGE}
