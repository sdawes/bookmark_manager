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

    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end

    link.save
    redirect to '/links'
  end

#:name is irrelevant, it is just so you can type in what you want in the url
# same with the second name request, it is just reffering to what is in the url.
  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  run! if app_file == $0
end
