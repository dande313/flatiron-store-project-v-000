class CartsController < ApplicationController
  before_action :user_signed_in?, only: [:show,:checkout]

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    cart = Cart.find(params[:id])
    cart.checkout
    redirect_to cart_path(cart)
  end

end
