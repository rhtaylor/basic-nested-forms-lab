class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new 
    @recipe.ingredients.build(name: nil) 
    @recipe.ingredients.build(name: nil)
  end

  def create 
    @recipe = Recipe.create(recipe_params)
    
    # @recipe.ingredients_attributes = ingredients_params                         
    
    if @recipe 
       @recipe.save 
       
      redirect_to recipe_path(@recipe) 
    else 
      render :new
    end
  end 

  private 
def recipe_params 
  params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
end


end
