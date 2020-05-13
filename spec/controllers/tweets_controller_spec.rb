require 'rails_helper'

describe ItemsController do
  let(:user) { create(:user)}
  
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
    let(:params) {{user_id: user.id, item: item}}
    context  '保存に成功した場合' do
    end

    context '保存に失敗した場合' do
    end
  end
end