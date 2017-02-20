require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'renders sign up page' do
      get :new
      expect(response).to render_template(:new)
    end
  end


  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to goals#index page' do
        post :create, user: { username: "Hyun", password: "password123" }
        expect(response).to redirect_to(goals_url)
      end
    end

    context 'with invalid params' do
      it 'renders new sign up page and flash errors' do
        post :create, user: { username: "Hyun" }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

end
