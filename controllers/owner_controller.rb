require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

also_reload( '../models/*' )

get '/owners' do
  @owners = Owner.all()
  erb(:"owner/index")
end

get '/owners/new' do
  erb(:"owner/new")
end

post '/owners' do
  @owners = Owner.new(params)
  @owners.save()
  erb(:"owner/create")
end



get '/owners/:id' do
  @owner = Owner.find(params[:id].to_i)
  @animals = @owner.animals()
  erb(:"owner/show")
end


get '/owners/:id/edit' do # edit
  @owner = Owner.find(params['id'] )
  erb(:"owner/edit")
end


post '/owners/:id' do
  @owner = Owner.new(params)
  @owner.update
  erb(:"owner/edit_confirmation")
end

post '/owners/:id/delete' do
  @owner = Owner.find(params[:id])
  @owner.delete()
  erb(:"owner/delete")
end
