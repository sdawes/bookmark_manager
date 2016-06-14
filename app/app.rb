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

#:name is irrelevant, it is just so you can type in what you want in the url
# same with the second name request, it is just reffering to what is in the url.
  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
      # if tag
      #   @links = tag.links
      # else
      #   @links = []
      # end
    erb :'links/index'
  end

  run! if app_file == $0
end
