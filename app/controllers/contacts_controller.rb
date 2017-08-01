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
            # フラッシュメッセージの設定
            flash[:success] = "お問い合わせが完了しました！"
            redirect_to root_path
            # メールも送信
            NoticeMailer.sendmail_contact(@contact).deliver_now
        else
            render "new"
        end
    end



    def confirm
        @contact = Contact.new(contacts_params)

        # validates に引っかかった場合は new へ
        render :new if @contact.invalid?
    end



    private

    def contacts_params
        params.require(:contact).permit(:name, :email, :content)
    end

end
