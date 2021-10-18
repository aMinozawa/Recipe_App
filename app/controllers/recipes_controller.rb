class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_corrent_user, only: [:edit, :update, :destroy]

  def index
    @text = "Randing Page"
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = "レシピを投稿しました。"
      redirect_to("/recipes/#{@recipe.id}")
    else
      flash[:alert] = "レシピが登録できませんでした。"
      render("recipes/new")
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to("/recipes/#{@recipe.id}")
    else
      render("recipes/new")
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to ("/recipes")
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :dish, :material, :recipe)
  end

  def ensure_corrent_user
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.user_id != current_user.id
      redirect_to("/recipes#{@recipe.id}")
    end
  end
end
