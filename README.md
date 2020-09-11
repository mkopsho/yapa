![yapa](./public/yapa-readme.png)
# YAPA
Yet Another Productivity App.

Use YAPA to build lists of tasks and manage them with your teams.

# Installation
In order to get started, clone this repository.

Navigate to the `yapa` directory and run:
```
bundle install
```

We can now set up our database. To initialize the database, run:
```
rails db:migrate
```

Now, we can start the web server. Run:
```
rails -s
```
This will start a web server that you can visit at [http://localhost:3000/](http://localhost:3000/). You're good to go!

## Google Auth
This project uses the [omniauth-google-oauth](https://github.com/zquestz/omniauth-google-oauth2) gem to log in with a Google account. If you want to use this, follow the instructions there to set up a Google developer project, OAuth consent screen, and gather credentials for your `.env` file. Assign the credentials to the appropriate variables in your `.env` file, e.g.,
```
GOOGLE_CLIENT_ID=<"Client ID" from Credentials>
GOOGLE_CLIENT_SECRET=<"Client secret" from Credentials>
```

# Contributing
Pull requests are not only welcome, they're encouraged! For major changes, please open an issue first to discuss what you would like to change.

* * *

# Demo and Blog

Demo: https://www.youtube.com/watch?v=oFEo7F6YmHw

Blog: https://kopsho.cafe/blog/rails-the-great-humbler.html

# License
[MIT](./LICENSE)
