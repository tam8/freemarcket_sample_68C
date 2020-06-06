class ItemsController < ApplicationController
  before_action :set_category
  before_action :set_item, only: %i[show edit update destroy]
  before_action :request_path

  # 商品詳細ページ (田村)
  def show
  end

  # トップページ・商品一覧ページ(本間・林)
  def index
    @items = Item.includes(:item_images).limit(3).order('created_at DESC')
    # itemに紐づいているitem_imagesを取得するためにincludesを使用
    # limit(3)でデータを３つまでしか表示できないように設定
    # order('created_at DESC')を使用することで、新しく出品された順に表示されるよう設定
  end

  # 商品出品ページ
  def new

    if user_signed_in?
      @item = Item.new(flash[:item])
      @item.item_images.new
      @category_parent = Category.roots
      
    else
      flash[:notice] = "商品の出品にはユーザー登録、もしくはログインをしてください"
      redirect_to new_user_registration_path
    end
  end

  def category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  # 商品出品機能
  # createしてしまうよりも、newでsaveすれば、true・false判定ができる
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "
      「#{@item.name}」を出品しました"
      # データの作成時点で、@itemにIDをが付与されている
      redirect_to @item
    else
      # render :new   この記述だと2回送信しないとエラー表示が出ない
      redirect_to new_item_path
      flash[:notice] = @item.errors.full_messages
      # 再入力時に前回のデータを記憶 (#newのflashで受け取り)
      flash[:item] = @item
    end
  end

  # 商品情報更新ページ (田村)
  def edit
    # @imgs[]

    # @item = current_user.items.find(params[:id])

    # @imgs.map { |img| img.image.cache! } unless @imgs.blank?
    # binding.pry
    @category_parent = Category.roots
    
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to item_path
    end
  end

  # 商品情報更新機能 (田村)
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      redirect_to edit_item_path
      flash[:notice] = @item.errors.full_messages
    end
  end

  # 商品削除機能
  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      flash[:notice] = "「#{@item.name}」を削除しました"
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  #商品購入機能（仮）
  def buy
  end

  #商品検索機能
  def search
    @items = Item.search(params[:keyword]).page(params[:page]).per(9)
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
                                 :category_id, 
                                 :buyer_id,
                                 item_images_attributes: [:image, :_destroy, :id]
                                #  TODO: :idはもともと無かったけど必要か？
                                #  :image_cache
                                 ).merge(user_id: current_user.id)
  end

  def set_item
    # finb_byでないとエラーになる (nilを返さない)
    if Item.find_by_id(params[:id]).nil?
      flash[:notice] = "指定の商品は存在しません"
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      @name = @item.name
      @price = @item.price
      @brand = @item.brand
      @explain = @item.explain

      # active_hashを利用
      @status = @item.status.name
      @shipping_fee = @item.shipping_fee.name
      @shipping_method = @item.shipping_method.name 
      @owners_area = @item.owners_area.name
      @arrival_date = @item.arrival_date.name

      # 仮
      @user = User.find(@item.user_id).nickname
      @buyer = @item.buyer_id

      # 配列なのでs付けておく
      @imgs = ItemImage.where(item_id: params[:id]) 
    end
  end

  # アクション毎にビューを条件分岐可能にする
  def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
          str.map{|s| self.include?(s)}.include?(true)
      end
  end

  def set_category
    @parents = Category.all.order("id ASC").limit(13)
  end

end