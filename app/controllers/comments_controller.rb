class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @place = Place.find(params[:place_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @place = Place.find(params[:place_id])
    @comment.place = @place
    @comment.user = current_user
    @comment.rating = 5 if @comment.rating == 1
    @comment.rating = 4 if @comment.rating == 2
    @comment.rating = 2 if @comment.rating == 4
    @comment.rating = 1 if @comment.rating == 5
    if @comment.save
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :text, :rating)
  end
end
