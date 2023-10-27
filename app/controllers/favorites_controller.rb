class FavoritesController < ApplicationController
  def create
    place_id = params[:place_id]
    favorite = current_user.favorites.find_by(place_id: place_id)

    if favorite
      favorite.destroy
      render json: { status: 'removed' }
    else
      current_user.favorites.create(place_id: place_id)
      render json: { status: 'added' }
    end
  end
end
