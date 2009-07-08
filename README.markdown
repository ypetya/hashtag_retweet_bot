# Hashtag retweet bot

A bot that retweets all tweets tagged by a certain tag. Ideal for conferences, meetup groups, communities, etc.

## Installation

    gem install balinterdi-hashtag_retweet_bot --source http://gems.github.com

Create the database that will hold the tweets:

    mysqladmin create my_conference

Create a directory where you will run the bot from:

    mkdir -p bot_for_my_conference/config
    cd config/bot_for_my_conference
    touch database.yml bot.yml

Put the credentials for the twitter account in _bot.yml_:

    login: my_conference_bot
    password: secret

Put the database connection attributes in _database.yml_:

    adapter: mysql
    username: root
    host: localhost
    password:
    database: my_conference

## Run it

Now the only thing left to do is to run the bot:

    hashtag_retweet_bot my_conference

## Credits

Original idea and script by [Mark Connell](http://github.com/mconnell) for Scotland on Rails 2009. Customization for Euruko '09 by [Jaime Iniesta](http://github.com/jaimeiniesta). Some improvements and gemification by [Balint Erdi](http://github.com/balinterdi).

Please send feedback and bug reports to <balint@bucionrails.com>