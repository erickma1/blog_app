require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  # Create some users with associated data
  let!(:user1) { FactoryBot.create(:user, name: 'User1') }
  let!(:user2) { FactoryBot.create(:user, name: 'User2') }
  let!(:user3) { FactoryBot.create(:user, name: 'User3') }
  let!(:user4) { FactoryBot.create(:user, name: 'User4') }

  before do
    # Create some posts for each user
    FactoryBot.create_list(:post, 2, author: user1)
    FactoryBot.create_list(:post, 3, author: user2)
    FactoryBot.create_list(:post, 1, author: user3)                                          
    FactoryBot.create_list(:post, 4, author: user4)

    visit users_path
  end

  scenario 'User sees username, profile picture, and number of posts' do
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user3.name)
    expect(page).to have_content(user4.name)
  end
  scenario 'Check if each users profile picture is visible' do
    expect(page).to have_css('img')
  end
  scenario 'Check if the number of posts each user has written is visible' do
    expect(page).to have_content("Number Of posts #{user1.posts_counter}")
    expect(page).to have_content("Number Of posts #{user2.posts_counter}")
    expect(page).to have_content("Number Of posts #{user3.posts_counter}")
    expect(page).to have_content("Number Of posts #{user4.posts_counter}")
  end

  scenario 'User clicks on a user and is redirected to their show page' do
    # Click on a user's link
    first('h2 a').click

    # Check if the page is redirected to the user's show page
    expect(page).to have_current_path(user_path(user1))

    first('h4 a').click
    expect(page).to have_current_path(user_post_path(user, user.posts.first))
  end
end