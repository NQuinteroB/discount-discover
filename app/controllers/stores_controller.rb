class StoresController < ApplicationController
 before_action :set_params, only: %i[destroy edit update show]
 before_action :authenticate_user!

  def index
    @stores = policy_scope(Store)
    # @stores = Store.all
  end

  def show
    authorize @store
    @product = Product.new
  end

  def new
    @store = Store.new
    authorize @store
  end

  def create
    @store=Store.new(store_params)
    authorize @store
    if @store.save
      redirect_to store_path(@store)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @store
    @store.destroy
    redirect_to stores_path, notice: "Your Store is Deleted🥺!!"
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

  private

  def set_params
    @store = Store.find(params[:id])
  end

   def store_params
     params.require(:store).permit(:name, :address, :opening_hour, :closing_hour, :user_id)
  end
end
