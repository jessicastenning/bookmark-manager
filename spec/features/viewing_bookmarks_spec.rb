feature 'viewing bookmarks' do
  scenario 'displaying bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "www.facebook.co.uk"
    expect(page).to have_content "www.google.co.uk"
    expect(page).to have_content "www.youtube.co.uk"
  end
end
