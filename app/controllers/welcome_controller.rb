class WelcomeController < ApplicationController
  def index
    @articulos = Article.all.order('id DESC')
  end

  def contacto
    @contactos = Contact.new
  end
end
