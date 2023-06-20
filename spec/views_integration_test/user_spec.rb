require 'rails_helper'

RSpec.describe User, type: :system do
  subject { User.new(name: 'Shafiu', photo: 'https://randomuser.me/api/portraits/women/67.jpg', bio: 'Project manager', post_counter: 3) }

  before { subject.save }

  describe 'index page' do
    it 'I can see the username of all other users.' do
      visit root_path(subject)
      page.has_content?(subject.name)
    end

    it 'I can see the profile picture for each user' do
      visit root_path(subject)
      page.has_content?(subject.photo)
    end

    it 'I can see the number of posts each user has written.' do
      visit root_path(subject)
      page.has_content?(subject.post_counter)
    end

    it "redirects to the user's show page" do
      user2 = User.create(name: 'Yushawu', photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                          bio: 'Teacher from Poland.', post_counter: 2)

      visit root_path

      within('.grid') do
        click_link('Yushawu')
      end

      expect(page).to have_content('Yushawu')
      expect(current_path).to eq(user_path(user2))
    end
  end

  describe 'User show page' do
    it "I can see the user's profile picture." do
      visit user_path(subject.id)
      page.has_css?('.img-fluid')
    end

    it "I can see the user's username." do
      visit user_path(subject.id)
      page.has_content?(subject.name)
    end

    it 'I can see the number of posts the user has written.' do
      visit user_path(subject.id)
      page.has_content?(subject.post_counter)
    end

    it "I can see the user's bio." do
      visit user_path(subject.id)
      page.has_content?(subject.bio)
    end

    it "I can see the user's first 3 posts." do
      Post.create(
        [
          {
            author: subject, title: 'First Post', text: 'My first post'
          },
          {
            author: subject, title: 'Second Post', text: 'My Second post'
          },
          {
            author: subject, title: 'Third Post', text: 'My Third post'
          }
        ]
      )
      visit user_path(subject.id)
      page.has_content?(subject.posts)
    end

    it "I can see a button that lets me view all of a user's posts." do
      visit user_path(subject.id)
      page.has_button?('See all posts')
    end



    it "redirects to the user's posts index page" do
      user = User.create(name: 'John Doe', photo: '', bio: 'Bio text', post_counter: 3)
      post1 = user.posts.create(title: 'Post 1', text: 'Text 1', comment_counter: 2, likes_counter: 5)
      post2 = user.posts.create(title: 'Post 2', text: 'Text 2', comment_counter: 1, likes_counter: 3)
      post3 = user.posts.create(title: 'Post 3', text: 'Text 3', comment_counter: 0, likes_counter: 2)

      visit user_path(user)

      within('.user_button') do
        click_link('See all posts')
      end

      expect(page).to have_content(post1.title)
      expect(page).to have_content(post2.title)
      expect(page).to have_content(post3.title)
    end
  end
end
