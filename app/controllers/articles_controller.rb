class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: %i[ edit update destroy new create]
  before_action :authenticate_user!, except: %i[ edit update destroy new create]
  before_action :authenticate_editor!, only: %i[ edit update destroy new create]
  before_action :authenticate_admin!, only: %i[ destroy ]

  def index
    @articulos = Article.all.order('id DESC')
  end

  def show
  end

  def new
    @articulo = Article.new
    @categories = Category.all
  end

  def create
    if params[:categories].nil?
      redirect_to new_article_path, alert: "Necesitas agregar minimo una categoria."
    else
      @articulo = current_user.articles.new(article_params)
      @articulo.categories = params[:categories]

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
    params.require(:article).permit(:title, :body, :categories)
  end
end
