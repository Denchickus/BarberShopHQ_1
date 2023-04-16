#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# set :database, "sqlite3:barbershop.db" # подключение к БД

set :database, {adapter: "sqlite3", database: "barbershop.db"} # подключение к БД

class Client < ActiveRecord::Base # миграция - очередная версия нашей БД

end

class Barber < ActiveRecord::Base

end



get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end