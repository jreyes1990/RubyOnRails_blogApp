class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cargar_registros

  def cargar_registros
    @categorias = Category.all.order('id DESC')
  end

  def authenticate_editor!
    redirect_to root_path, alert: "No tiene permiso para entrar aqui." unless user_signed_in? && current_user.is_editor_user?
  end

  def authenticate_admin!
    redirect_to root_path, alert: "No tienes suficientes permisos para entrar aqui." unless user_signed_in? && current_user.is_admin_user?
  end
end
