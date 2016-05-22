class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
     @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def contact_params
    params.require(:contact).permit!
  end
end
