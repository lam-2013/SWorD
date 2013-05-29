namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Luigi De Russis",
                 email: "luigi.derussis@polito.it",
                 password: "sword2013",
                 password_confirmation: "sword2013")
     admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      # take users from the Rails Tutorial book since most them have a "real" profile pic
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    # generate fake 50 posts for the first 10 users
    users = User.all(limit: 10)
    50.times do
      post_content = Faker::Lorem.sentence(8)
      users.each { |user| user.posts.create!(content: post_content )}
    end
  end
end