require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Shafiu', photo: 'shafiu.jpg', bio: 'Software Engineer', post_counter: 0)
    @post = Post.create(
      title: 'Post 1',
      text: 'Post body',
      author: @user,
      comment_counter: @user.comments.count,
      likes_counter: 3
    )

    @comment1 = Comment.create(author: @user, post: @post, created_at: 5.days.ago)
    @comment2 = Comment.create(author: @user, post: @post, created_at: 4.days.ago)
    @comment3 = Comment.create(author: @user, post: @post, created_at: 3.days.ago)
    @comment4 = Comment.create(author: @user, post: @post, created_at: 2.days.ago)
    @comment5 = Comment.create(author: @user, post: @post, created_at: 1.day.ago)
    @comment6 = Comment.create(author: @user, post: @post, created_at: Time.now)
  end

  context 'validations for post blog' do
    it 'should require the title of the blog' do
      title = @post.title
      expect(title).to eq 'Post 1'
    end

    it 'should require the text or body of the post' do
      text = @post.text
      expect(text).to eq 'Post body'
    end

    it 'should set the author to the name of the user' do
      author = @post.author.name
      expect(author).to eq 'Shafiu'
    end

    it 'should set the comment counter to the number of comments' do
      comment_counter = @post.comment_counter
      expect(comment_counter).to eq 6
    end

    it 'should set the likes counter to the required number' do
      likes_counter = @post.likes_counter
      expect(likes_counter).to eq 3
    end
  end

  context 'return the recent five comments' do
    it 'should return the five comments' do
      recent_comments = @post.comments.order(created_at: :desc).limit(5)
      expect(recent_comments).to match_array([@comment6, @comment5, @comment4, @comment3, @comment2])
    end
  end
end
