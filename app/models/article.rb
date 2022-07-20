class Article < ApplicationRecord
  # Usuario pertenece a Articulo
  belongs_to :user

  #Validaciones en campos
  validates :title, :body, presence: {message: 'El campo no pueden estar vacio(s)'}
  validates :title, length: {in: 5..25, message: 'Debe ingresar minimo 5 caracteres y maximo 25'}
  validates :body, length: {in: 25..200, message: 'Debe ingresar minimo 25 caracteres y maximo 200'}
  validates :title, :uniqueness => {message: 'El Titulo debe ser unico'}
end
