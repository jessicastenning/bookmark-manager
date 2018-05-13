require 'pg'

feature 'adding bookmarks' do
  scenario 'submiting a new bookmark via a form' do
    visit('/')
    fill_in :url_address, with: ('http://github.com')
    click_button'Submit'

    expect(page).to have_content ('http://github.com')
  end
end

feature 'viewing bookmarks' do
  scenario 'displaying bookmarks' do

    Bookmark.create(url: 'http://makersacademy.com')
    Bookmark.create(url: 'http://destroyallsoftware.com')
    Bookmark.create(url: 'http://google.com')

    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://destroyallsoftware.com"
  end
end

feature 'validating bookmarks' do
  scenario 'displays an error if user enters invalid url' do
    visit('/')
    fill_in :url_address, with: ('htop:/?youtube.com')
    click_button 'Submit'
    expect(page).to have_content ('invalid url address')
  end
end
