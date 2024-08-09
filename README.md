## Prerequisites

1. Docker
2. Docker Compose

## Clone the Repository

```
git clone https://github.com/shiibs/fyle-interview-intern-backend
cd fyle-interview-intern-backend
```

## Build the Docker Images

```
docker-compose build
```

## Run the Application

```
docker-compose up
```

### This command will:

1.  Start the Flask application server.
2.  Start the SQLite database service.

The application will be accessible at http://localhost:7755.

## Run Tests

```
docker-compose run test
```

### This command will:

    Reset the database.
    Run the tests defined in the tests/ directory.

### File Descriptions

1. Dockerfile: Defines the environment for the Flask application, including dependencies and entrypoint script.
2. docker-compose.yml: Defines the services, including the application, test, and database services, and their configurations.
3. entrypoint.sh: A script that determines whether to run tests or start the server based on the argument provided.
