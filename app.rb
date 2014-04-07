require 'sinatra'

class App < Sinatra::Base
  configure :production do
    require 'newrelic_rpm'
  end

  get '/' do
    erb :home
  end

  get '/*' do |page|
    begin
      erb page.to_sym
    rescue Errno::ENOENT
      raise Sinatra::NotFound
    end
  end
end
