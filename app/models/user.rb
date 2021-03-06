class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Incluyendo los permisos de usuario
  include PermissionsConcern

  #Tabla User haciendo referencia a las siguientes tablas
  has_many :articles
  has_many :categories
end
