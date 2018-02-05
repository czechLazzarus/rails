# Category Controller
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    redirect_to action: 'edit'
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: 'Category was updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    remove_category_dependencies
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def remove_category_dependencies
    CategoriesContact.where(category_id: @category.id).destroy_all
    CategoriesEmailTemplate.where(category_id: @category.id).destroy_all
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
