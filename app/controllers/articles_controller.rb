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

    respond_to do |format|
      if @articulo.save
        format.html {redirect_to article_path(@articulo), notice: "El articulo #{@articulo.title} se creo exitosamente."}
        format.json {render :show, status: :created, location: @articulo}
      else
        format.html {render :new}
        format.json {render json: @articulo.errors.full_messages, status: :unprocessable_entity}
        puts "************************************************"
        puts @articulo.errors.full_messages
        puts "************************************************"
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @articulo.update(article_params)
        format.html {redirect_to article_path(@articulo), notice: "El articulo #{@articulo.title} se actualizo exitosamente."}
        format.json {render :show, status: :ok, location: @articulo}
      else
        format.html {render :edit}
        format.json {render json: @articulo.errors.full_messages, status: :unprocessable_entity}
        puts "************************************************"
        puts @articulo.errors.full_messages
        puts "************************************************"
      end
    end
  end

  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html {redirect_to articles_url(@articulo), notice: "El articulo #{@articulo.title} se elimino exitosamente."}
      format.json {head :no_content}
    end
  end

  private
  def set_article
    @articulo = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
