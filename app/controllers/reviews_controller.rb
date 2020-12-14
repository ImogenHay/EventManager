class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_location, only: [:new, :create]
  before_action :authenticate_user! #need to be logged in to leave reviews
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.user_reviews(current_user).ordered #scope uses devise current user object to restrict search
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = @location.reviews.new #sets location of review
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @location.reviews.new(review_params) #new review with only trusted parameters
    @review.user = current_user #set user to current user logged in

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format| #uses AJAX for live updates when review destroyed
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.js { flash[:notice] = 'Review was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:location_id, :description, :rating)
    end

  #sets location to location of review
    def set_location
      @location = Location.find_by(id: params[:location_id]) || Location.find(review_params[:location_id])
    end
end
