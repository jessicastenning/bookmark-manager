require 'sinatra'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :add_bookmarks
  end

  post '/add_bookmarks' do
    @bookmark = Bookmark.create(params[:url_address])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    ENV
    @bookmarks = Bookmark.all
    erb :index
  end

  run! if app_file ==$0
end
