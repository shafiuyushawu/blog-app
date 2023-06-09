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

  validates :title, presence: true, length: {minimum: 5, maximum: 255}
  validates :comment_counter, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: 'Must be an integer ggreater than equal to zero'}
  validates :likes_counter, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: 'Must be an integer ggreater than equal to zero'}
end
