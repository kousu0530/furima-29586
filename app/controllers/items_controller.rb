class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new, :create,:edit, :update ] 

 
 

  def index
    @items = Item.includes(:user).order('created_at DESC')
   end
   
  def show
    @item = Item.find(params[:id])
    #@seller = User.find(@item.seller_id)
    #@comment = Comment.new
    #@comments = @item.comments.includes(:user)
    #@items = Item.where(category: @item.category_id).where.not(id: @item.id).order(created_at: :desc).limit(3)
  end

  def new
    @item = Item.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")
      flash[:alert] = '出品するには、ログインするか新規会員登録をしてください。'
  end
  

    def create
    
     @item = Item.new(item_params)
    
      if @item.valid?
       @item.save
       flash[:notice] = '出品が完了しました'
        redirect_to root_path  
      else
       flash.now[:alert] = '必須項目を入力してください'
       render :new  
      end
    end


     def destroy
       if current_user.id == @item.user.id
         @item.destroy
         redirect_to root_path
        else
        flash.now[:alert] = '必須項目を入力してください'
        @item = Item.new(item_params)
        @item.images.new
         render :show
        end
       end

   def edit
   end
   
    def update
      if @item.update(item_params)
        flash[:notice] = '更新が完了しました'
        redirect_to root_path
      else
        flash.now[:alert] = '更新できませんでした。必須項目を入力してください。'
        render :edit
      end
    end
  

   private
   def item_params
     params.require(:item).permit(:name,:price, :explanation, :quality_id, :shipping_charge_id, :delivery_date_id, :area_id, :user, :category_id,:image).merge(user_id: current_user.id)
   end

  def set_item
     @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id		
      redirect_to action: :index
    end
  end
end