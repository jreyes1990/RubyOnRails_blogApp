module PermissionsConcern extend ActiveSupport::Concern
  #Nivel de permiso usuario
  def is_normal_user?
    self.permission_level == 0
  end

  def is_editor_user?
    self.permission_level >= 1
  end

  def is_admin_user?
    self.permission_level >= 2
  end
end