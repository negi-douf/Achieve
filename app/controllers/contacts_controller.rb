class ContactsController < ApplicationController
    
    def new
        if params[:back]
            @contact = Contact.new(contacts_params)
        else
            @contact = Contact.new
        end
    end
    
    
    def create
        @contact = Contact.new(contacts_params)
        if @contact.save
            redirect_to new_contact_url, notice: "お問い合わせありがとうございました！"
        
        else
            render "new"
        end
    end
    
    
    
    def confirm 
        @contact = Contact.new(contacts_params)
        
        # validates に引っかかった場合は new へ
        render :new if @contact.invalid?
    end
    
    
    
    ########
    private
    ########
    
    def contacts_params
        params.require(:contact).permit(:name, :email, :content) 
    end
    
end
