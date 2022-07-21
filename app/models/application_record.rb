class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #Metodos de autenticacion
  protected
  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor_user?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin_user?
  end
end
