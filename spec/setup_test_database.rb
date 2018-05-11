require 'pg'

p "Setting up test database..."

def connect
connection = PG.connect(dbname: 'bookmark_manager_test')

connection.exec("TRUNCATE bookmarks;")
end
