class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [, :edit, :update, :destroy ]

  def index
    # listar todos restaurants
    @restaurants = Restaurant.all
  end

  def show
    # encontra detalhes de restaurants
  end

  def new
    # show formulario para novo restaurant
    @restaurant = Restaurant.create
  end

  def create
    # criar um novo restaurant
    new_restaurant = Restaurant.new(restaurant_params)

    new_restaurant.save

    # redirect_to ?
  end

  def edit
    # editar um restaurant existente
  end

  def update
    # confirmar a edicao do restaurant
  end

  def top
    @restaurant = Restaurant.where(stars: 5)
  end

  def destroy
    # delete restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
