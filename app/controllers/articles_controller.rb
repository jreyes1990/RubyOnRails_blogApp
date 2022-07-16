class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def index
    @articulos = Article.all.order('id DESC')
  end

  def new
    @articulo = Article.new
  end

  def create
    @articulo = Article.new(article_params)
    if @articulo.save
      redirect_to article_path(@articulo), notice: 'El articulo se creo de forma exitosa.'
    else
      render :new, status: :unprocessable_entity
      puts "************************************************"
      puts @articulo.errors.full_messages
      puts "************************************************"
    end
  end

  def show
  end

  private
  def set_article
    @articulo = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
