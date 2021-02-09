class ItemsController < ApplicationController
  #before_action :move_to_index, except: [:create, :index] #:show 
   before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create ] 

 
 

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
    #@item.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")
    #else
      flash[:alert] = '出品するには、ログインするか新規会員登録をしてください。'
      #redirect_to root_path
  end
  

    def create
    
     @item = Item.new(item_params)
    
      if @item.valid?
       @item.save
       flash[:notice] = '出品が完了しました'
        redirect_to root_path  
      else
       @category_parent_array = Category.where(ancestry: nil).pluck(:name)
       @category_parent_array.unshift("---")
       flash.now[:alert] = '必須項目を入力してください'
       render :new  
      end
    end


    # def destroy
    #   if current_user.id == @item.user.id
    #     @item.destroy
    #     redirect_to root_path
    #    else
    #      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    #    @category_parent_array.unshift("---")
    #    flash.now[:alert] = '必須項目を入力してください'
    #    @item = Item.new(item_params)
    #    @item.images.new
    #     render :show
    #    end
    #   end

   #def edit
    #edit_category
   #end

   
  #  def update
  #    if item_params[:images_attributes].nil?
  #      flash.now[:alert] = '更新失敗しました。画像を登録してください。'
  #      edit_category
  #      render :edit
  #    else
  #      exit_ids = []
  #      item_params[:images_attributes].each do |a,b|
  #        exit_ids << item_params[:images_attributes].dig(:"#{a}",:id).to_i
  #     end
  #     ids = Image.where(item_id: params[:id]).map{|image| image.id }
  #     delete__db = ids - exit_ids
  #     Image.where(id:delete__db).destroy_all
  #     @item.touch
  #     if @item.update(item_params)
  #       flash[:notice] = '更新が完了しました'
  #       redirect_to item_path(@item.id)
  #     else
  #       set_item
  #       edit_category
  #       flash.now[:alert] = '更新できませんでした。必須項目を入力してください。'
  #       render :edit
  #     end
  #   end
  #end

   private
   def item_params
     params.require(:item).permit(:name,:price, :explanation, :quality_id, :shipping_charge_id, :delivery_date_id, :area_id, :user, :category_id,:image).merge(user_id: current_user.id)
   end

   def set_item
     @item = Item.find(params[:id])
   end

   
   def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end