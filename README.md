# python_api_container
## HTTP REST application in Python using Flask framework
In this example, we're using the Flask-Limiter extension which provides a convenient way to implement rate limiting in Flask applications. The Limiter object is initialized with the app object and a key_func which determines the rate limit key based on the source IP address of the request.

The default_limits parameter sets a default rate limit for all routes in the application that don't have a specific limit set. In this example, we're setting a default rate limit of 10 requests per minute.

The @limiter.limit() decorator is used to set a specific rate limit for the /api route. In this example, we're limiting the rate to 5 requests per minute.

With this implementation, you can easily modify the rate limit by changing the value in the @limiter.limit() decorator without changing the code of the application.

## Dockerfile that can package the Flask application
In this Dockerfile, we're starting with the python:3.9-alpine base image, which is a lightweight version of the Python 3.9 image optimized for Alpine Linux. We're setting environment variables to configure the Flask app, including the app file name, the host to listen on, and the environment (set to production).

We're also setting the working directory to /app, copying the app.py file and requirements.txt file into the working directory, and installing the dependencies listed in the requirements.txt file.

We're then exposing port 5000, which is the default port for Flask applications, and using the CMD instruction to start the Flask application with the flask run command.

To build and run the Docker container, navigate to the directory with the Dockerfile and run the following commands:
```
# Build the Docker image
docker build -t my-flask-app .

# Run the Docker container
docker run -p 5000:5000 my-flask-app
```
This will build the Docker image with the name my-flask-app and then run the container, mapping port 5000 from the container to port 5000 on the host machine.
## Docker manifest that can run the Flask app container and a separate log forwarding container using Fluentd
In this example, we have two services defined in our Docker Compose file: flask-app and fluentd.

The flask-app service is defined with the my-flask-app image and is configured to run three replicas with limited resources (0.5 CPUs and 256MB of memory). The service is also configured to log to Fluentd using the fluentd driver and is tagged with my-flask-app. The logs will be forwarded to the Fluentd container running on the same host.

The fluentd service is defined with the official fluent/fluentd:v1.14.2-debian-1.0 image and is configured with volumes to mount the configuration and log directories. The service is also exposed on port 24224 for Fluentd log forwarding.

To run this Docker Compose file, save it as docker-compose.yml and run the following command:
```
docker-compose up -d

```

This will start the two services in separate containers. The Flask app containers will log to Fluentd using the fluentd driver, and the Fluentd container will forward the logs to the 3rd party service like Kibana based on the configuration in the mounted configuration directory.

## Requirements.txt for dependencies
Example requirements.txt file that includes the Flask and Flask-Limiter libraries for the rate limiting feature, as well as the Fluentd logging driver for Docker

You can then manually remove any packages that you don't need, and add any additional packages that are required for your application. In this case, we added Flask, Flask-Limiter, and fluent-logger to the file.
