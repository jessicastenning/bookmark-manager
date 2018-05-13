require 'pg'

class Bookmark

  attr_reader :id, :url_address

  def initialize(id, url_address)
    @id = id
    @url_address = url_address
  end

  def ==(other)
    @id = other.id
  end

  def self.create(url_address)
    self.environment_checker
    #@connection.exec("INSERT INTO bookmarks (url) VALUES('#{url_address}')")
    result = @connection.exec("INSERT INTO bookmarks (url) VALUES('#{url_address[:url]}') RETURNING id, url")
    Bookmark.new(result.first['id'], result.first['url'])
  end

  def self.all
    self.environment_checker
    result = @connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url']) }
  end

  def self.url_checker(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

private

  def self.environment_checker
    if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
    @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
