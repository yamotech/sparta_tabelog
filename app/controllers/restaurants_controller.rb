class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @new_restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
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
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to "/restaurants"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :url)
  end

end
