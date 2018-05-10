feature 'viewing bookmarks' do
  scenario 'displaying bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://facebook.co.uk"
    expect(page).to have_content "http://google.co.uk"
    expect(page).to have_content "http://youtube.co.uk"
  end
end
