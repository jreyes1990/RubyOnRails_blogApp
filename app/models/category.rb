class Category < ApplicationRecord
  # Usuario pertenece a Articulo
  belongs_to :user

  #Validaciones en campos
  validates :name, :color, presence: {message: 'Los campos no pueden estar vacio(s)'}
  validates :name, length: {in: 7..20, message: 'Debe ingresar minimo 7 caracteres y maximo 20'}
  validates :color, length: {in: 4..7, message: 'Debe ingresar minimo 4 caracteres y maximo 7'}
  validates :name, :uniqueness => {message: 'El Nombre debe ser unico'}
end
