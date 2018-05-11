require 'pg'

class Bookmark

  attr_reader :url_address

  def initialize(url_address)
    @url_address = url_address
  end

  def self.create(url_address)
    self.environment_checker
    @connection.exec("INSERT INTO bookmarks (url) VALUES('#{url_address}')")

  end

  def self.all
    self.environment_checker
    result = @connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
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
