# frozen_string_literal: true

require 'sinatra'

set :environment, :production
set :server, :puma

get '/' do
  'Hello World!'
end
