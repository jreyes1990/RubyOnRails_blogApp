class Category < ApplicationRecord
  # Usuario pertenece a Articulo
  belongs_to :user

  #Validaciones en campos
  validates :name, presence: {message: 'El Nombre no puede estar vacio'}
  validates :color, presence: {message: 'El Color no puede estar vacio'}
  validates :name, length: {maximum: 30, minimum: 5, message: 'Debe ingresar minimo 5 caracteres y maximo 30'}
  validates :color, length: {maximum: 20, minimum: 5, message: 'Debe ingresar minimo 5 caracteres y maximo 20'}
  validates :name, :uniqueness => {message: 'El Nombre debe ser unico'}
end
