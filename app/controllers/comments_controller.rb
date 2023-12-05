class CommentsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @comment = @place.comments.new
  end

  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to @place }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :text, :rating)
  end
end
