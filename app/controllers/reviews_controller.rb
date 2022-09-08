class ReviewsController < ApplicationController
  before_action :set_store, only: [:new, :create, :show, :index]
  def index
    @reviews = policy_scope(Review)
    @store_reviews = @store.reviews
  end

    def show
      authorize @review
    end

  def new
    @review = Review.new
    authorize @review

  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.store_id = @store.id
    authorize @review
    if @review.save
      redirect_to store_reviews_path(@store), notice: "Review added 👍", status: :see_other

    else
      flash[:alert] = "Something went wrong."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
