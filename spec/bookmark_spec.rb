require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'should return the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://facebook.co.uk")
      expect(bookmarks).to include("http://google.co.uk")
      expect(bookmarks).to include("http://youtube.co.uk")
    end
  end
end
