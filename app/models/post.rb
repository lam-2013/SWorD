class Post < ActiveRecord::Base
  # only content must be accessible, in order to avoid manual (and wrong) associations between posts and users
  attr_accessible :content

  # each post belong to a specific user
  belongs_to :user

  # descending order for getting the posts
  default_scope order: 'posts.created_at DESC'

  # user_id must be present while creating a new post...
  validates :user_id, presence: true
end
