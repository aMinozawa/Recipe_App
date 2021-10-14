class RecipesController < ApplicationController
  def index
    @text = "Randing Page"
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "レシピを投稿しました。"
      redirect_to("/recipes/new")
    else
      flash[:alert] = "レシピが登録できませんでした。"
      render("recipes/new")
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :material, :recipe)
  end
end
