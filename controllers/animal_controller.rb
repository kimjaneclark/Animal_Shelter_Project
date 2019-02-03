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


get '/animals/:id/edit' do # edit
  @animals = Animal.find( params[:id] )
  erb( :edit )
end
