class Category < ApplicationRecord
  # Usuario pertenece a Articulo
  belongs_to :user

  #Validaciones en campos
  validates :name, :color, presence: {message: 'Los campos no pueden estar vacio(s)'}
  validates :name, length: {in: 7..20, message: 'Debe ingresar minimo 7 caracteres y maximo 20'}
  validates :color, length: {in: 4..7, message: 'Debe ingresar minimo 4 caracteres y maximo 7'}
  validates :name, :uniqueness => {message: 'El Nombre debe ser unico'}

  #Tabla Has_categorias haciendo referencia a la tabla Categoria
  has_many :has_categories
  #Relacion a la tabla articles a traves de la tabla has_categories
  has_many :articles, through: :has_categories
end
