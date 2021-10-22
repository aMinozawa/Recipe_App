class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.recipe_id = params[:recipe_id]
    if @comment.save
      redirect_to("/recipes/#{params[:recipe_id]}")
    else
      @recipe = Recipe.find(params[:recipe_id])
      render "recipes/show"
    end

    def destroy
      @recipe = Recipe.find(params[:recipe_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to ("/recipes/#{params[:recipe_id]")
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
