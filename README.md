## SWorD ##
SWorD (Social Web of real Domotics) is a prototype social network where users, homes, providers, devices and appliances can interact and act in a "smarter" way, by talking each other and thus lowering the technical knowledge to use home automation and domotics systems.

### Sign in with OAuth 2.0 ###

* This example follows LAB 7 *

1) Add and install `omniauth` gems

- generic, for Twitter and Facebook

2) Add `omniauth.rb` in `config/initializers`

- the initializer stores the consumer keys and secrets for each service providers
- the keys and the secrets present in this example will be removed AS SOON AS possible!

3) Update the routes to handling sign in with OAuth

- add `match '/auth/:provider/callback', to: 'sessions#create'`

4) Update the User model

- add two new columns: `twitter_uid` and `facebook_uid` with a migration
- put the new attributes as `attr_accessible`
- add a method for taking and storing user credential

5) Add new links for signing in with Twitter and Facebook to the home page

6) Update the `create` action in the Session controller

 - it generates all the missing and mandatory fields (e.g., password and password confirmation)