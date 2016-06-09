#CONTROLLER

require 'sinatra'
require './contacts_file'

set :port, 4567

get '/' do
   "<h1>Tacta Contact Manager</h1>"
end

#show all contacts
get '/contacts' do
   @contacts = read_contacts
   erb :'contacts/index'
end

#New Contacts
get '/contacts/new' do
   erb :'contacts/new'
end

#show individual contacts
get '/contacts/:i' do
   @i = params[:i].to_i
   contacts = read_contacts
   @contact = contacts[@i]
   erb :'contacts/show'
end

