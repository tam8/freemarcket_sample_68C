class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # 商品詳細ページ (田村)
  def show
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
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  # 商品情報更新ページ (田村)
  def edit
  end

  # 商品情報更新機能 (田村)
  def update
  end

  # 商品削除機能
  def destroy
  end

  private
  # 出品時にフォーム入力されるデータ
  def item_params
    params.require(:item).permit(:name, 
                                   :price, 
                                   :status_id, 
                                   :brand, 
                                   :shipping_fee_id, 
                                   :shipping_method_id, 
                                   :owners_area_id, 
                                   :arrival_date_id, 
                                   :explain, 
                                   :a_category_id, 
                                   :buyer_id,
                                   item_images_attributes: [:image_url]
                                   )
                                    #  .merge(user_id: current_user.id)をユーザー登録機能が出来たら追記する。 永井
  end


  def set_item
    @item = Item.find(params[:id])
    @name = @item.name
    @price = @item.price
    @brand = @item.brand
    @status = ItemStatus.find(@item.status).name
    @shipping_fee = ItemShippingFee.find(@item.shipping_fee).name
    @shipping_method = ItemShippingMethod.find(@item.shipping_method).name
    # 配列なのでs付けておく
    @owners_area = Prefecture.find(@item.owners_area).name
    @arrival_date = ItemArrivalDate.find(@item.arrival_date).name
    @explain = @item.explain
    @category = ItemCategory.find(@item.category_id).name
    @imgs = ItemImage.where(item_id: params[:id]) 




  end
end
end