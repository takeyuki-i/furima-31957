class ItemsController < ApplicationController

def new
  @item = Item.new
  # (item_params)
end

# private

# def item_params
#   params.require(:item).permit(:image,:name,:text,:category_id,:state_id ,:delivery_fee_id ,:delivery_area_id ,:delivery_time_id ,:price) 
# end

end