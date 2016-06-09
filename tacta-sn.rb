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

post '/contacts' do
   new_contact = { name: params[:name], phone: params[:phone], email: params[:email] }

   contacts = read_contacts
   contacts << new_contact
   write_contacts( contacts )

   i = contacts.length - 1

   redirect "/contacts/#{i}"
end

#show individual contacts
get '/contacts/:i' do
   @i = params[:i].to_i
   contacts = read_contacts
   @contact = contacts[@i]
   erb :'contacts/show'
end

#New Contacts
get '/contacts/new' do
   erb :'contacts/new'
end

#Edit
get '/contacts/:i/edit' do
   @i = params[:i].to_i

   contacts = read_contacts
   @contact = contacts[@i]

   erb :'contacts/edit'
end

post '/contacts/:i/update' do
   i = params[:i].to_i

   updated_contact = { name: params[:name], phone: params[:phone], email: params[:email] }

   contacts = read_contacts
   contacts[i] = updated_contact
   write_contacts( contacts )

   redirect "/contacts/#{i}"
end
