require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

also_reload( '../models/*' )

get '/animals' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb(:"animal/index")
end

get '/animals/new' do
  erb(:"animal/new")
end

get '/animals/available' do
  @animals = Animal.available()
  erb(:"animal/available")
end

get '/animals/training' do
  @animals = Animal.training()
  erb(:"animal/training")
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

post '/animals/:id/ready_for_adoption' do
  @animal = Animal.find(params[:id])
  @animal.available_for_adoption()
  redirect to '/animals/available'
end

get '/animals/:id/adoption' do
  @animal = Animal.find(params['id'] )
  @owners = Owner.all()
  erb(:"animal/adoption")
end

post '/animals/:id/adopted' do
  @animal = Animal.find(params[:id])
  owner = Owner.find(params[:owner_id])
  @animal.adopted(owner)
  erb(:"animal/adoption_confirmation")
end
