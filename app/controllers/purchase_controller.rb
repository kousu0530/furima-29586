class PurchaseController < ApplicationController
  
before_action :authenticate_user!, only: [:index,:create]
before_action :set_item, only: [:index, :create]
before_action :move_to_index, only: [:index, :create]


def index
 @purchase_address= PurchaseAddress.new
end

def create
  
  @purchase_address = PurchaseAddress.new(purchase_params) 
  if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
  else
    render :index
  end
end

private
  def purchase_params
    params.require(:purchase_address).permit(:tell,:purchase,:postal_code,:area_id,:city,:prefectures,:apartment).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end 

  def move_to_index
    redirect_to root_path  unless @item.purchase.nil?

    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create( 
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end