class Order < ActiveRecord::Base

  def show
    @order = Order.find(params[:id])
  end

end
