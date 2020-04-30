class ItemsController < ApplicationController

  # 商品詳細ページ (田村)
  def show
    @item = Item.find(params[:id])
    # 配列なのでs付けておく
    @item_imgs = ItemImage.where(item_id: params[:id]) 
  end

  # トップページ・商品一覧ページ
  def index
   end

  # 商品出品ページ
  def new
    @item = Item.new
    @item.item_images.new
  end

  # 商品出品機能
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # 商品情報更新ページ
  def edit
  end

  # 商品情報更新機能
  def update
  end

  # 商品削除機能
  def destroy
  end

    private
      def product_params
        params.require(:item).permit(:name, 
                                     :price, 
                                     :status, 
                                     :brand, 
                                     :shipping_fee, 
                                     :shipping_method, 
                                     :owners_area, 
                                     :arrival_date, 
                                     :explain, 
                                     :category_id, 
                                     :buyer_id,
                                     item_images_attributes: [:image_url]
                                     ).merge(user_id: current_user.id)
      end
end
