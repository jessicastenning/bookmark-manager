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
    if params[:url_address] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      @bookmark = Bookmark.create(params[:url_address])
      redirect '/bookmarks'
    else
      flash[:error] = "invalid url address"
      redirect '/'
    end
  end

  get '/bookmarks' do
    ENV
    @bookmarks = Bookmark.all
    erb :index
  end

  run! if app_file ==$0
end
