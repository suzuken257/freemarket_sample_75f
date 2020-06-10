require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe ' index' do

    context 'ログインしている場合' do
      before do
        login user
        get :index, params: { user_id: user.id }
      end

      it '@itemに期待した値が入っていること' do
        expect(assigns(:item)).to be_a_new(item)
      end

      it '@deliver_addressに期待した値が入っていること' do
        expect(assigns(:category)).to eq category
      end

      it 'index.html.haml に遷移すること' do
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      before do
        get :index, params: { user_id: user.id }
      end

      it 'ログイン画面にリダイレクトすること' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end