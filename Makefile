build:
	- docker kill `docker ps -q`
	docker build -t site-backend:latest .

test: build
	docker run --rm -it -p 80:80/tcp site-backend:latest python3 manage.py test

launch: build
	docker run --rm -it -p 80:80/tcp site-backend:latest