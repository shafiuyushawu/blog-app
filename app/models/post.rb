class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :update_posts_count

  def recent_five_comments
    comments.order(create_at: :desc).limit(5)
  end

  private

  def update_posts_count
    author.increment!(:post_counter)
  end
end
