## Starting the server using the provided Makefile

This container must be started before the frontend.  The backend server can be started using the following:

`make launch`

You can also run tests with `make test`

## Starting the server without using the provided Makefile

1. When this container is launched,, it is run detached, so there is a chance its still running.  To fix this, we'll kill all running containers first.

`docker kill $(docker ps -q)`

2. The Dockerfile is written to make it easy to change the output port.  This is done with an API_PORT env variable, which should be set first.

`export API_PORT=2000`

3. Next, we use `sed` to configure the `API_PORT` variable within the Dockerfile and create a temporary one

`sed s/API_PORT/$(API_PORT)/g Dockerfile > Dockerfile.out`

4. Now, build the container providing the temporary Dockerfile

`docker build -t site-backend:latest -f Dockerfile.out .`

5. (Optional) Remove the temporary Dockerfile

`rm Dockerfile.out`

6. Now it is time to launch the server.  This can be done with Docker with

`docker run --rm -d -p $(API_PORT):$(API_PORT)/tcp site-backend:latest`