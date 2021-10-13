PORT=2000

build:
	- docker kill `docker ps -q`
	docker build -t site-backend:latest .

test: build
	docker run --rm -p $(PORT):$(PORT)/tcp site-backend:latest python3 manage.py test

launch: build
	docker run --rm -it -p $(PORT):$(PORT)/tcp site-backend:latest