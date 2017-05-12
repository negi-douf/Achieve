class ContactsController < ApplicationController
    
    def new
        @contact = Contact.new
    end
    
    
    def create
        Contact.create(contacts_params)
        redirect_to new_contact_url
    end
    
    
    
    
    
    ########
    private
    ########
    
    def contacts_params
       params.require(:contact).permit(:name, :email, :content) 
    end
    
end
