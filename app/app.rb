require 'sinatra/base'
require './app/data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to '/links'
  end

  run! if app_file == $0
end
