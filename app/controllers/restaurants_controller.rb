class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [ :show, :edit, :update, :destroy]

  def index
    @q = Restaurant.order(created_at: :desc).ransack(params[:q])
    @restaurants = @q.result.page(params[:page]).per(2)
    @new_restaurants = Restaurant.order(created_at: :desc).limit(5)
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  def destroy
    @restaurant.destroy
    redirect_to "/restaurants"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :url)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
