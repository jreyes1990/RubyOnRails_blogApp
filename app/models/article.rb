class Article < ApplicationRecord
  validates :title, presence: {message: 'El Titulo no puede estar vacio'}
  validates :body, presence: {message: 'El Cuerpo del titulo no puede estar vacio'}
  validates :title, length: {maximum: 200, minimum: 5, message: 'Debe ingresar minimo 5 caracteres y maximo 200'}
  validates :body, length: {maximum: 200, minimum: 5, message: 'Debe ingresar minimo 5 caracteres y maximo 200'}
  validates :body, :uniqueness => {message: 'El nombre debe ser unico'}
end
