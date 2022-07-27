class ContactsController < ApplicationController
  def new
    @contacto = Contact.new
  end

  def create
    @contacto = Contact.new(contacts_params)

    respond_to do |format|
      if @contacto.save
        InfoMailer.form_contact(@contacto).deliver
        format.html {redirect_to root_path, notice: "El correo se creo exitosamente."}
        format.json {render :show, status: :created, location: @contacto}
      else
        format.html {render :new, alert: "Problema al enviar su corre."}
        format.json {render json: @contacto.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def contacts_params
    params.require(:contact).permit(:title, :description, :email)
  end
end
