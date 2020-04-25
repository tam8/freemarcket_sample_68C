class ItemsController < ApplicationController

  # 商品詳細ページ (田村)
  def show
    @item = Item.find(params[:id])
  end

  # トップページ・商品一覧ページ
  def index
   end

  # 商品出品ページ
  def new
  end

  # 商品出品機能
  def create
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

end
