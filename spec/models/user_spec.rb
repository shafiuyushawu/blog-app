require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Shafiu', photo: 'shafiu.jpg', bio: 'Software Engineer', post_counter: 0)

    @post1 = Post.create(title: 'Post 1', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 3)
    @post2 = Post.create(title: 'Post 1', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
    @post3 = Post.create(title: 'Post 1', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
  end

  context 'should assign to the right values provided' do
    it 'should set the name to value provided' do
      name = @user.name
      expect(name).to eq 'Shafiu'
    end

    it 'should set the photo to value provided' do
      photo = @user.photo
      expect(photo).to eq 'shafiu.jpg'
    end

    it 'should set the bio to value provided' do
      bio = @user.bio
      expect(bio).to eq 'Software Engineer'
    end

    it 'should set the post counter to value provided' do
      post_counter = @user.post_counter
      expect(post_counter).to eq 3
    end
  end

  context 'should return the number of posts' do
    it 'should return the number of post successfully posted' do
      post_count = @user.three_recent_posts.count
      @user.three_recent_posts
      expect(post_count).to eq 3
    end
  end
end
