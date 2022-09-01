class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :dashboard ]
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def index
    @stores = Store.all
  end

  def dashboard
    @user = current_user
  end
end
