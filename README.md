# Selenium Grid

Spin up a [Selenium Grid](https://github.com/SeleniumHQ/docker-selenium) within Docker containers. 

## Quick Start

Build Selenium Hub and Node images:

```
docker build -t arya-testing/selenium-hub ./hub
docker build -t arya-testing/selenium-node-chrome ./node-chrome
docker build -t arya-testing/selenium-node-firefox ./node-firefox
```

Run the containers using docker-compose:

```
docker-compose up       # start
docker-compose down     # stop
```

Or use docker run:

```
docker network create -d bridge selenium-grid

docker run -d --name selenium-hub --network=selenium-grid -p 4444:4444 arya-testing/selenium-hub

docker run -d --name selenium-node-chrome --network=selenium-grid -e HUB_HOST=selenium-hub -e NODE_PORT=5555 -p 5555:5555 arya-testing/selenium-node-chrome

docker run -d --name selenium-node-firefox --network=selenium-grid -e HUB_HOST=selenium-hub -e NODE_PORT=5556 -p 5556:5556 arya-testing/selenium-node-firefox
```

To remove containers:

```
docker rm -f selenium-hub selenium-node-chrome selenium-node-firefox
docker network rm selenium-grid
```

## Build Arguments

* VERSION

Click [here](https://github.com/SeleniumHQ/docker-selenium) for additional supported build arguments.

## Environment Variables

Click [here](https://github.com/SeleniumHQ/docker-selenium) for supported environment variables.