require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'should return the list of bookmarks in an array' do

      bookmark_1 = Bookmark.create(url: 'http://makersacademy.com')
      bookmark_2 = Bookmark.create(url: 'http://destroyallsoftware.com')
      bookmark_3 = Bookmark.create(url: 'http://google.com')

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '#url_checker' do
      it 'should return true if a valid url is entered' do
        expect(Bookmark.url_checker('http://youtube.com')).to eq 0
      end

      it 'should return false if an invalid url address is entered' do
        expect(Bookmark.url_checker('ht??:youtube.com')).to eq nil
      end
  end

  describe '#create' do
    it 'should create a new bookmark' do
      bookmark = Bookmark.create(url: 'http://lemonade.com')
      expect(Bookmark.all).to include bookmark
    end
  end

  describe '#==' do
    it 'should recognise two bookmarks are equal if their ids match' do
      bookmark_1 = Bookmark.new(1, 'http://spiderman.com')
      bookmark_2 = Bookmark.new(1, 'http://spiderman.com')

      expect(bookmark_1).to eq bookmark_2
    end
  end
end
