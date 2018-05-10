require 'sinatra'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/bookmarks' do
    p ENV 
    @bookmarks = Bookmark.all
    erb :index
  end

  run! if app_file ==$0
end
