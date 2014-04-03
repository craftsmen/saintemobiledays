Bundler.setup
require 'sprockets'
require './app'

map '/assets' do
  foundation_path = Bundler.load.specs.select{|g| g.name=="zurb-foundation"}.first.full_gem_path

  environment = Sprockets::Environment.new
  environment.cache = Sprockets::Cache::FileStore.new("/tmp")

  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/images'
  environment.append_path "#{foundation_path}/js"
  environment.append_path "#{foundation_path}/scss"
  run environment
end

set :raise_errors, true
run App
