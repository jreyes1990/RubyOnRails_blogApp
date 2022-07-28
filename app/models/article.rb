class Article < ApplicationRecord
  # Usuario pertenece a Articulo
  belongs_to :user

  #Validaciones en campos
  validates :title, :body, presence: {message: 'El campo no pueden estar vacio(s)'}
  validates :title, length: {in: 5..25, message: 'Debe ingresar minimo 5 caracteres y maximo 25'}
  validates :body, length: {in: 25..200, message: 'Debe ingresar minimo 25 caracteres y maximo 200'}
  validates :title, :uniqueness => {message: 'El Titulo debe ser unico'}

  #Tabla Has_categorias haciendo referencia a la tabla Articulo
  has_many :has_categories
  #Relacion a la tabla categories a traves de la tabla has_categories
  has_many :categories, through: :has_categories

  #Despues de crear los Articulos, guardar las categorias seleccionadas
  after_create :save_categories

  #Uso de scopes
  scope :ultimos, -> {order("id DESC")}
  #scope :ult, -> {where(title: "Laptop ASUS")}
  scope :titulo, -> (title) {where("title LIKE ?","%#{title}%")}
  #scope :titulo, -> (find_titulo) {where title: find_titulo}


  #Uso de imagen
  has_attached_file :img_art, styles: { big: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img_art, content_type: /\Aimage\/.*\z/

  def categories=(value)
    @categories = value
    #raise @categories.to_yaml
  end

  private
  def save_categories
    @categories.each do |category_id|
      HasCategory.create(category_id: category_id, article_id: self.id)
    end
  end

end
