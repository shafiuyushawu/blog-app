class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_count
  after_destroy :update_comment_count
  private

  def update_comment_count
    post.update(comment_counter: post.comments.count)
  end
end
