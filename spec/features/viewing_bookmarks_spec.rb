require 'pg'

feature 'viewing bookmarks' do
  scenario 'displaying bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES('http://makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com');")

    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://destroyallsoftware.com"
  end
end
