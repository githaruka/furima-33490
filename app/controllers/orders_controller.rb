class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_substitution

  def index
    @buy_form = BuyForm.new
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @buy_form = BuyForm.new(order_params)
    if @buy_form.valid?
      pay_item
      @buy_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:buy_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_substitution
    @item = Item.find(params[:item_id])
  end
end
