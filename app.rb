require 'sinatra'
require 'sinatra/flash'
require_relative './lib/bookmark'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :add_bookmarks
  end

  post '/add_bookmarks' do
    if Bookmark.url_checker(params[:url_address])
      @bookmark = Bookmark.create(params[:url_address])
      redirect '/bookmarks'
    else
      flash[:error] = "invalid url address"
      redirect '/'
    end
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  run! if app_file ==$0
end
