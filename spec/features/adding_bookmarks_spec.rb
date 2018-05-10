feature 'adding bookmarks' do
  scenario 'submiting a new bookmark via a form' do
    visit('/')
    fill_in :url_address, with: ('http://github.com')
    click_button'Submit'
    
    expect(page).to have_content ('http://github.com')
  end
end
