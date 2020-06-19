class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_purchase, only: [:show, :pay]

  def show
    if @item.buyer_id.present? 
      redirect_to controller: "items", action: "show"
      return
    elsif
    card = Card.where(user_id: current_user.id).first
    # テーブルからpayjpの顧客IDを検索
    end
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay  
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル紐づけ）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  if @item.update(buyer_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
  else
    flash[:alert] = '購入に失敗しました。'
  end
  end

  def set_purchase
    @item = Item.find(params[:id])
  end

end
