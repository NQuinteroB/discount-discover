class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :dashboard ]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
  if params[:query].present?
        @stores = Store.search_by_name(params[:query])
      else
        @stores = Store.all
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
    @stores_show = []
    @stores.each do |store|
      @stores_show << store if store.products.first.discount >= params[:discount].to_i
    end

    @markers = @stores.geocoded.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
        info_window: render_to_string(partial: "stores/info_window", locals: {store: store})
      }
    end
  end
end
