API_PORT=2000

build:
	- docker kill `docker ps -q`
	sed s/API_PORT/$(API_PORT)/g Dockerfile > Dockerfile.out
	docker build -t site-backend:latest -f Dockerfile.out .
	rm Dockerfile.out

test: build
	docker run --rm -p $(API_PORT):$(API_PORT)/tcp site-backend:latest python3 manage.py test

launch: build
	docker run --rm -d -p $(API_PORT):$(API_PORT)/tcp site-backend:latest

launch-interactive: build
	docker run --rm -it -p $(API_PORT):$(API_PORT)/tcp site-backend:latest