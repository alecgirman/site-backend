build:
	- docker kill $(docker ps -q)
	docker build -t site-backend:latest .

launch: build
	docker run --rm -it -p 80:80/tcp site-backend:latest