class ContactsController < ApplicationController
  def create
    @contacto = Contact.new(contacts_params)

    respond_to do |format|
      if @contacto.save
        format.html {redirect_to contacts_path(@contacto), notice: "El correo se creo exitosamente."}
      else
        format.html {redirect_to contacts_path(@contacto), alert: "Problema al enviar su corre."}
      end
    end
  end

  private
  def contacts_params
    params.require(:contact).permit(:title, :email, :description)
  end
end
