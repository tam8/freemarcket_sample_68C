require 'rails_helper'

describe ItemsController do
  let(:user) { create(:user)}
  let(:item) { create(:item)}
  describe '#new' do
    
    context 'ログインしている場合' do
      before do
        login user
      end

      it "new.html.hamlに移動すること" do
        get :new
        expect(response).to render_template :new        
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面にリダイレクトさせること' do
        get :new
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe '#create' do
    before do
      login user
    end
    context  '保存に成功した場合' do
      let(:params) do
        {item:  attributes_for(:item), user_id: user.id }
        item.item_images << FactoryBot.build(:item_image)
      end
      subject {
        post :create,
        params: params
      }

      it 'itemを保存すること' do
        expect { subject }.to change(Item, :count).by(1)
      end

      it '詳細ページにリダイレクトされること'do
        subject
        expect(response).to redirect_to(item_path(item))
      end
    end

    context '保存に失敗した場合' do
      let(:invalid_params) do
        {item:  attributes_for(:item, expalin: nil), user_id: user.id }
      end
      subject {
        post :create,
        params: invalid_params
      }
      it 'itemを保存しないこと' do
        expect{ subject }.not_to change(Item, :count)
      end

      it 'new.html.hamlに遷移すること' do
        subject
        expect(response).to render_template :new
      end
    end
  end
end