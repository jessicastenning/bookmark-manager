require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'should return the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("www.facebook.co.uk")
      expect(bookmarks).to include("www.google.co.uk")
      expect(bookmarks).to include("www.youtube.co.uk")
    end
  end
end
