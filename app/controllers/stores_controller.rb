class StoresController < ApplicationController
 before_action :set_params, only: %i[show destroy edit update]
 before_action :authenticate_user!, except: [:index, :show]
 before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store=Store.new(store_params)
    if @store.save
      redirect_to store_path(@store)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice: "Your Store is Deleted🥺!!"
  end

  def show
    @review = Review.new

  end

  def edit

  end

  def update
    if @store.update(store_params)
      redirect_to store_path(@store), notice: "Your Store has been edited successfully!!"
    else
      render :edit, status: :unprocessable_entity
    end
    
  end

  def correct_user
    @store = current_user.stores.find_by(id: params[:id])
    redirect_to stores_path, notice: "Not Authorized To Edit❌" if @store.nil?
  end

  private

  def set_params
    @store = Store.find(params[:id])
  end

   def store_params
     params.require(:store).permit(:name, :address, :opening_hour, :closing_hour)
  end
end
