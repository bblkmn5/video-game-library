VIDEO GAME LIBRARY

This web app allows a user to keep track of the video game consoles and games that they own. A user can signup/login to their account and see a list of all of their consoles. From there, a signed in user can add, edit, and delete any console or game that they have. Lists are sorted by all games from a certain console, as well as individual lists of all consoles owned.


INSTALLATION

Download the repo, cd into the directory, then run

```
bundle install
rake db:migrate
```

And then run either:

```
shotgun
```

or:

```
rackup config.ru
```

and point your browser to the address given (such as 127.0.0.1:9393 or localhost:9393)

I hope you enjoy this Sinatra database with ActiveRecord project!
