require 'sinatra'

class App < Sinatra::Base
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
