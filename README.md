# Docker Web Terminal

A web-based terminal for docker container.

### Demo

[http://docker-web-terminal.coding.io](http://docker-web-terminal.coding.io)

### Run outside of docker

    $ npm install && bower install && npm start

### Build image

    docker build -t "vangie/docker-web-terminal" --rm .

### Start container

    docker run -d -p 5000:5000 vangie/docker-web-terminal:latest

### Open in browser

    open http://`boot2docker ip`:5000

### Author

Vangie Du from Coding IDE Team <duwan@coding.net>  [http://codelife.me](http://codelife.me)

### License

The MIT License (MIT)
