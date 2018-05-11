require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'should return the list of bookmarks in an array' do

      Bookmark.create('http://makersacademy.com')
      Bookmark.create('http://destroyallsoftware.com')
      Bookmark.create('http://google.com')

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

    describe '#url_checker' do
      it 'should return true if a valid url is entered' do

      end
  end
end
