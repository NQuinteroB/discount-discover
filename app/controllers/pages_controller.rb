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
end
