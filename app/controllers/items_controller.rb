class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  
  private

  def item_params
    params.require(:item).permit(:image,:name, :info, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :delivery_schedule_id, :price).merge(user_id: current_user.id)
  end

end
