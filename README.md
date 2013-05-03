## SWorD ##

### LAB2 ###
1) Creation of static pages for our social network: home, about and contact

- `rails generate controller Pages home about contact` (or from the RubyMine menu *Tools > Run Rails Generator...*)

2) Adding title to HTML files: "SWorD | Page name"

- by using the `provide` method in each view, i.e., `<% provide :title, 'Page name' %>`

- by editing the title tag in `app/views/layouts/application.html.erb`, i.e., `<title>SWorD | <%= yield(:title) %>`

- learn more about `provide` at [http://api.rubyonrails.org/classes/ActionView/Helpers/CaptureHelper.html#method-i-provide](http://api.rubyonrails.org/classes/ActionView/Helpers/CaptureHelper.html#method-i-provide)