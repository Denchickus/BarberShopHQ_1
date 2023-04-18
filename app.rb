#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# set :database, "sqlite3:barbershop.db" # подключение к БД

set :database, {adapter: "sqlite3", database: "barbershop.db"} # подключение к БД

class Client < ActiveRecord::Base # миграция - очередная версия нашей БД
	validates :name, presence: true, length: { minimum: 3 } # валидация поля "name", проверка поля на пустое значение
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Barber < ActiveRecord::Base

end

before do
	@barbers = Barber.all # Обёртка для запроса "SELECT * FROM barbers;"
	#@barbers = Barber.order "created_at DESC"
end

get '/' do
	erb :index
end

# tux - консоль для ActiveRecord


get '/visit' do
	@c = Client.new
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

	@c = Client.new params[:client]
	if @c.save # этот метод выполняет валидацию пред сохранением в БД и возвращает true если валидация пройдена и false если нет. Если валидация пройдена сохраняет в БД
		erb "<h2>Спасибо, Вы записались!</h2>"
	else
		@error = @c.errors.full_messages.first # вывод первого сообщения об ошибке
		erb :visit
	end
end