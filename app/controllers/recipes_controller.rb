class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'bell peppers')
    @recipe.ingredients.build(name: 'parsely')
  end

  def create    
    puts params
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe.id)
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )  
  end
end
