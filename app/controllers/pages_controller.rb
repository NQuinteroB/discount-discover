class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :dashboard ]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @stores = Store.all
    @markers = @stores.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def dashboard
    @user = current_user
  end

  def favourites
    @stores = current_user.all_favorites
  end

  def map
    @stores = Store.all
    @markers = @stores.geocoded.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
        info_window: render_to_string(partial: "stores/info_window", locals: {store: store})
      }
    end
  end
end
