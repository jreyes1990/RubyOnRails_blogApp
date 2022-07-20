class Article < ApplicationRecord
  # Usuario pertenece a Articulo
  belongs_to :user

  #Validaciones en campos
  validates :title, presence: {message: 'El Titulo no puede estar vacio'}
  validates :body, presence: {message: 'El Cuerpo del titulo no puede estar vacio'}
  validates :title, length: {maximum: 50, minimum: 5, message: 'Debe ingresar minimo 5 caracteres y maximo 50'}
  validates :body, length: {maximum: 200, minimum: 5, message: 'Debe ingresar minimo 5 caracteres y maximo 200'}
  validates :title, :uniqueness => {message: 'El Titulo debe ser unico'}
  validates :user_id, presence: {message: 'El usuario debe estar referenciado'}
end
