require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Shafiu', photo: 'shafiu.jpg', bio: 'Software Engineer', post_counter: 0)
    @post = Post.create(title: 'Post 1', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 3)
    @comment = Comment.create(post: @post, author: @user, text: 'Great')
  end

  context 'comment' do
    it 'should contain the comment' do
      text = @comment.text
      expect(text).to eq 'Great'
    end

    it 'expect comment counter to increase' do
      expect do
        Comment.create(post: @post, author: @user, text: 'New Comment')
        @post.reload
      end.to change { @post.comment_counter }.by(1)
    end
  end
end
