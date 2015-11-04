require_relative 'contact'
require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  erb :contacts
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/:id' do
  Contact.delete_contact(params['id'].to_i)
  redirect to('/contacts')
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

put '/modify' do

end
