## SWorD ##
SWorD (Social Web of real Domotics) is a prototype social network where users, homes, providers, devices and appliances can interact and act in a "smarter" way, by talking each other and thus lowering the technical knowledge to use home automation and domotics systems.

### LAB2 ###
1) Creation of static pages for our social network: home, about and contact

- `rails generate controller Pages home about contact` (or from the RubyMine menu *Tools > Run Rails Generator...*)

2) Add title to HTML files: "SWorD | Page name"

- by using the `provide` method in each view, i.e., `<% provide :title, 'Page name' %>`
- by editing the title tag in `app/views/layouts/application.html.erb`, i.e., `<title>SWorD | <%= yield(:title) %>`
- learn more about `provide` at [http://api.rubyonrails.org/classes/ActionView/Helpers/CaptureHelper.html#method-i-provide](http://api.rubyonrails.org/classes/ActionView/Helpers/CaptureHelper.html#method-i-provide)

3) Add an helper to avoid wrong rendering if the page title is not declared

- in `app/helpers/application_helper.rb`
- by editing the title tag in `app/views/layouts/application.html.erb`

### LAB3 - Preparation ###
1) Fill with some contents all the views

2) Add `bootstrap-sass` gem to include the Bootstrap framework with Sass support [http://twitter.github.io/bootstrap/](http://twitter.github.io/bootstrap/)

- update the `Gemfile`
- run `bundle install`

3) Add and fill a custom SCSS file in `app/assets/stylesheets`

### LAB4 ###
1) Move HTML shim, header and footer code in three partials (placed in `app/views/layouts/`)

2) Update the `routes.rb` file, according to the table present in the exercise 1 text

3) Update links present in `_header.html.erb` and `_footer.html.erb`

4) Add a faq page:

- add a new view called `faq.html.erb` with a content similar to the other views
- update the Pages controller
- add the corresponding named route to `routes.rb`

5) Add a Users controller and a page named "new"

- `rails generate controller Users new` (or from the RubyMine menu *Tools > Run Rails Generator...*)
- fill the content of the `new.html.erb` view
- update/add the corresponding named route to `routes.rb`, mapping it with the signup URI
- update the "Sign Up" link present in `home.html.erb`

### LAB 5 ###
1) Generate the User model, with two attributes: name and email

- `rails generate model User name:string email:string` (or from the RubyMine menu *Tools > Run Rails Generator...*)

2) Migrate the model to the database (i.e., create the table and columns corresponding to the User model)

- `bundle exec rake db:migrate` (or from the RubyMine menu *Tools > Run Rake Tasks...*)

