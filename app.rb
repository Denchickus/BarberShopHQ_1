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

before do
	@barbers = Barber.all
	#@barbers = Barber.order "created_at DESC"
end

get '/' do
	erb :index
end

# tux - консоль для ActiveRecord


get '/visit' do
	erb :visit
end

post '/visit' do

	# @username = params[:username]
	# @phone = params[:phone]
	# @datetime = params[:datetime]
	# @barber = params[:barber]
	# @color = params[:colorpicker]

	# # name, phone, datestamp, barber, color

	# c = Client.new 
	# c.name = @username
	# c.phone = @phone
	# c.datestamp = @datetime
	# c.barber = @barber
	# c.color = @color
	# c.save

	c = Client.new params[:client]
	c.save

	erb "<h2>Спасибо, Вы записались!</h2>"
end