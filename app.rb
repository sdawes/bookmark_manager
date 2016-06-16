ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'


class Bookmarks < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, "super secret"

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) # doens't have to be an instance variable at this stage
    end
  end

  get '/' do
    'HELLO YOU'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new_user'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new_user'
    end
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])

    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end

    link.save
    redirect '/links'
  end

  get '/tags/:tag_name' do
    tag = Tag.first(name: params[:tag_name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/sessions/new' do
    erb :'sessions/new_sessions'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/links')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end


  run! if app_file == $0
end
