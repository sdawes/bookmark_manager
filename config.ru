<<<<<<< HEAD
ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require File.join(File.dirname(__FILE__), 'app.rb')

run Bookmarks
=======
require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/app.rb')

run BookmarkManager
>>>>>>> b35914ebd2f96793a533e3c5c5c80210e9b67766
