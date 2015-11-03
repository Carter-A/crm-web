require_relative 'contact'
require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
  Contact.create("Yehuda", "Katz", "yehuda@example.com", "Developer")
  Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  Contact.create("Sergey", "Brin", "sergey@google.com", "Co-Founder")
  
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end
