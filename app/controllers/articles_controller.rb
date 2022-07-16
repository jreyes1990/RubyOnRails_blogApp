class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articulos = Article.all.order('id DESC')
  end

  def show
  end

  def new
    @articulo = Article.new
  end

  def create
    @articulo = Article.new(article_params)
    if @articulo.save
      redirect_to article_path(@articulo), notice: "El articulo #{@articulo.title} se creo exitosamente."
    else
      render :new, status: :unprocessable_entity
      puts "************************************************"
      puts @articulo.errors.full_messages
      puts "************************************************"
    end
  end

  def edit
  end

  def update
    if @articulo.update(article_params)
      redirect_to article_path(@articulo), notice: "El articulo #{@articulo.title} se actualizo exitosamente."
    else
      render :edit, status: :unprocessable_entity
      puts "************************************************"
      puts @articulo.errors.full_messages
      puts "************************************************"
    end
  end

  def destroy
    @articulo.destroy
    redirect_to articles_url(@articulo), notice: "El articulo #{@articulo.title} se elimino exitosamente."
  end

  private
  def set_article
    @articulo = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
