# dad_status

## Dev notes
Heroku's [heroku-docker plugin][1] is a fantastic way to get the best of both worlds: easy local development with Docker and (almost) foolproof production on Heroku. All you need to start is the [Heroku Toolbelt][2].

Make sure the plugin is installed:

    heroku plugins:install heroku-docker

Configure Docker and Docker Compose:

    heroku docker:init

And run the app locally:

    docker-compose up web

The app will now be available on the Docker daemon IP on port 8080.

To run one-off commands, ie. database migrations or and other rake tasks, you can open a shell instead of a web worker:

    docker-compose run shell
    # bundle exec rake -T


To open the site in a host browser

    open "http://$(docker-machine ip default):8080"

You can also use Docker to release to Heroku:

    heroku create
    heroku docker:release
    heroku open

## Contribute
Contributions are always welcome. Submit a pull request or send me an email with suggestions.

This project is released under the MIT license.

[1]: https://github.com/heroku/heroku-docker
[2]: https://toolbelt.heroku.com/
