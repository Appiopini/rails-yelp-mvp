class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [ :show, :edit, :update, :destroy ]

  def index
    # listar todos restaurants
    @restaurants = Restaurant.all
  end

  def show
    # encontra detalhes de restaurants
    @review = Review.new
  end

  def new
    # show formulario para novo restaurant
    @restaurant = Restaurant.new
  end

  def create
    # criar um novo restaurant
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    # editar um restaurant existente
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
    # confirmar a edicao do restaurant
  end

  def top
    @restaurant = Restaurant.where(stars: 5)
  end

  def destroy
    # delete restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
