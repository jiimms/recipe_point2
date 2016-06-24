class RecipesController < ApplicationController

  before_action :find_recipe, only: [:show, :edit, :destroy, :show, :update]
  def index
    @recipes=Recipe.all.order("created_at Desc")
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "success"
    else
      render :edit, notice: "hmm"
    end        
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Killed"
  end

  def new
    @recipe=Recipe.new
  end

  def create
    @recipe=Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "created"
    else
      render :new, notice: "check again"
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :image, :remove_image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy] )
    end

    def find_recipe
      @recipe=Recipe.find(params[:id])
    end
end
