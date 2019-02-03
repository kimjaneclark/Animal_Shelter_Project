require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

also_reload( '../models/*' )

get '/animals' do
  @animals = Animal.all()
  erb(:"animal/index")
end

get '/animals/new' do
  erb(:"animal/new")
end

post '/animals' do
  @animals = Animal.new(params)
  @animals.save()
  erb(:"animal/create")
end


get '/animals/:id' do
  @animal = Animal.find(params[:id].to_i)
  erb(:"animal/show")
end

get '/animals/:id/edit' do # edit
  @animal = Animal.find(params['id'] )
  erb(:"animal/edit")
end


post '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update
  erb(:"animal/edit_confirmation")
end


post '/animals/:id/delete' do
  @animal = Animal.find(params[:id])
  @animal.delete()
  erb(:"animal/delete")
end
