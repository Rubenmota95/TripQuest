class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :museus, :lagoas, :trilhos, :aldeias ]

  def index
    @places = Place.all
    @current_user = current_user
  end

  def museus
    @places = Place.where(category: 'museus')
    @favorite_places = current_user.favorites.pluck(:place_id) if user_signed_in?
  end

  def lagoas
    @places = Place.where(category: 'lagoas')
    @favorite_places = current_user.favorites.pluck(:place_id) if user_signed_in?
  end

  def trilhos
    @places = Place.where(category: 'trilhos')
    @favorite_places = current_user.favorites.pluck(:place_id) if user_signed_in?
  end

  def aldeias
    @places = Place.where(category: 'aldeias')
    @favorite_places = current_user.favorites.pluck(:place_id) if user_signed_in?
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new(place: @place)
    @markers = [
      {
        lat: @place.latitude,
        lng: @place.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    ]
  end

  def new
    if current_user.role == "admin"
      @place = Place.new
    else
      redirect_to places_path, alert: "Access denied."
    end
  end

  def create
    if current_user.role == "admin"
      @place = Place.new(place_params)
      if @place.save
        redirect_to place_path(@place)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if current_user.role == "admin"
      @place.destroy
      puts "deleting place"
      redirect_to places_path
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :category, :description, :address, photos: [] )
  end
end
