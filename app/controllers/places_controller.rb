class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :museus, :lagoas, :trilhos, :aldeias ]

  def index
    @places = Place.all
  end

  def museus
    @places = Place.all.where(category: "museus")
  end

  def lagoas
    @places = Place.all.where(category: "lagoas")
  end

  def trilhos
    @places = Place.all.where(category: "trilhos")
  end

  def aldeias
    @places = Place.all.where(category: "aldeias")
  end

  def show
    @place = Place.find(params[:id])
  end

end
