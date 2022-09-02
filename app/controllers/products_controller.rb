class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_store, only: [:index, :new, :create]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    @products = @store.products
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
    authorize @product
    #@product = current_user.products.build
  end

  def create
    #@product = Product.new(product_params)
    @product=  @store.products.build(product_params)
    @product.store = @store
    authorize @product
    if @product.save
      redirect_to store_path(@store)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    authorize @product
    redirect_to store_path(@product.store), status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :store_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end
end
