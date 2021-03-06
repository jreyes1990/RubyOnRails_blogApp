class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!, only: %i[ edit update destroy new create]
  before_action :authenticate_user!, except: %i[ edit update destroy new create]
  before_action :authenticate_editor!, only: %i[ edit update destroy new create]
  before_action :authenticate_admin!, only: %i[ destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all.order("id DESC")

    if user_signed_in? && current_user.is_editor_user? && !params.has_key?(:normal)
      render :"admin_category"
    end
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "La categoria #{@category.name} se creo exitosamente." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "La categoria #{@category.name} se actualizo exitosamente." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "La categoria #{@category.name} se elimino exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :color)
    end
end
