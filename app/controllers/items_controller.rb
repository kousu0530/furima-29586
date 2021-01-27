class ItemsController < ApplicationController
  # before_action :move_to_index_edit, only: [:edit]
  # before_action :authenticate_user!, only: :new
  # before_action :move_to_index_destroy, only: [:destroy]



  def index
    # @items = Item.all.order('created_at DESC')
  end

  # def show
  #   #@item = Item.find(params[:id])
  #   #@user = User.find(@item.seller_id)
  #   @category_id = @item.category_id
  #   @category_parent = Category.find(@category_id).parent.parent
  #   @category_child = Category.find(@category_id).parent  
  #   @category_grandchild = Category.find(@category_id)
  # end

  # def new
  #   @item = Item.new
  # end

  # def create
  #   Item.new(item_params)
  #   if @item.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end


  # def destroy
  #   if current_user.id == @item.user.id
  #     @item.destroy
  #     redirect_to root_path
  #    else
  #     render :show
  #    end
  #   end

  # def edit
  # end

  # def update
  #   if @item.update(item_params)
  #     redirect_to item_path(@item.id)
  #   else
  #     render :edit
  #   end
  # end

  # private
  # def item_params
  #   params.require(:item).permit(:name,:price, :explanation, :quality_id, :shipping_charge_id, :delivery_date_id, :area_id, :user, :category_id)
  # end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
    


