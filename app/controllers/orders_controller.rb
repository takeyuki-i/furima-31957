class OrdersController < ApplicationController
before_action :set_order

  def index
    @product_buy = ProductBuy.new
  end

  def create
    @product_buy = ProductBuy.new(info_params)
    if @product_buy.valid?
      @product_buy.save
      redirect_to "/"
    else
      render action: :index
    end
  end

private

  def info_params
    params.require(:product_buy).permit(:number, :exp_month, :exp_year, :cvc, :zip_code, :delivery_area_id , :city, :addres1, :addres2, :tell_num).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end