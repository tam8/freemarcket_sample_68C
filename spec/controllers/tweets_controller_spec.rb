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
end