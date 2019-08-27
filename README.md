# NVM Kata
[![CircleCI](https://circleci.com/gh/essjayhch/nvm_kata.svg?style=svg)](https://circleci.com/gh/essjayhch/nvm_kata)
[![Maintainability](https://api.codeclimate.com/v1/badges/fb4b9b7edf7c2ca939c4/maintainability)](https://codeclimate.com/github/essjayhch/nvm_kata/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/fb4b9b7edf7c2ca939c4/test_coverage)](https://codeclimate.com/github/essjayhch/nvm_kata/test_coverage)
This is an api system that is designed to answer the coding challenge

It provides a few RESTful endpoints as follows:

    GET /api/v1/:a/add/:b => Returns the result of a + b
    GET /api/v1/:a/sub/:b => Returns the result of a - b
    GET /api/v1/:a/mul/:b => Returns the result of a * b
    GET /api/v1/:a/div/:b => Returns the result of a / b
    GET /api/v1/:a/fact => Returns the result of a!

Input for a & b is any integer or float value. Passing in strings of arbitrary nature will force an error to be raised

### Responses
responses to API calls are in JSON format, and will be in the format `{status: :ok, result: :res}` for successful operations and an error payload will be returned where errors are encountered


### Docker
A very simple Dockerfile is provided to run this in a container: `docker build -it essjayhch/nvm_kata .` will run this build locally.
the build script should build the container. It can be triggered from the command line by running `docker_start.sh`
DockerHub is also configured to auto-build on commit to master the repository can be found at [Dockerhub](https://hub.docker.com/r/essjayhch/nvm_kata)

## Tests
### Unit and Integratoin tests
A basic test suite has been provided, which can be accessed and run by running `bundle exec rake test`
### Linting
Some linting for the user application code has been set up to run. This can be run by running `bundle exec rake rubocop`. The included .rubocop.yml file limits the tests to the non-api parts of the code (as rubocop invariably has a large amount of tweaking for rails apps otherwise)

## Build Script
In order to build a basic tarball of this application, there is a `build.sh` script provided. This runs bundle install, runs the linting and test suite methods, and if that succeeds, it then constructs a tarball for the project in the parent directory called ../nvm_kata.tar.gz
### TODO
Tidy the script so it doesn't include so much noise and/or git headers

