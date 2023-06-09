require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Shafiu', photo: 'shafiu.jpg', bio: 'Software Engineer', post_counter: 0)
    @post1 = Post.create(title: 'Post1', text: 'Post content', author: @user, comment_counter: 0, likes_counter: 0)
    @post2 = Post.create(title: 'Post2', text: 'Post content', author: @user, comment_counter: 0, likes_counter: 0)
    @post3 = Post.create(title: 'Post3', text: 'Post content', author: @user, comment_counter: 0, likes_counter: 0)
  end
  
  context "should set the fields to the values provided" do
    it 'should set the name to its value provided' do
        name = @user1.name 
        expect(name).to eq 'Shafiu'
    end
    
    it 'should set the photo to its value provided' do 
        photo = @user1.photo 
        expect(photo).to eq 'shafiu.jpg'
    end
    
    it 'should set the post counter to its  value provided' do 
        post_counter = @user1.posts_counter 
        expect(post_counter).to eq 1
    end
  end

  context 'test for three recent posts' do 
    it 'should return three recent post' do 
        three_recent_posts = @user.three_recent_posts
        expect(three_recent_posts).to eq 3
    end
  end

  
end