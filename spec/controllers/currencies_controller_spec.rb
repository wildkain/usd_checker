require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it 'assigns a new Currency to @currency' do
      expect(assigns(:currency)).to be_a_new(Currency)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new currency in database' do
        expect { post :create, params: {  format: :js, currency: attributes_for(:currency) } }.to change(Currency, :count).by(1)
      end
    end
    context 'with invalid attrs' do
      it 'should not create new currency' do
        expect { post :create, params: {format: :js, currency: attributes_for(:invalid_currency) } }.to_not change(Currency, :count)
      end
    end
  end

  describe 'PATCH #update' do
    let!(:currency) { create(:currency, value: 125)}
    before(:each) do
      patch :update, params: {  id: currency, currency: { value: 100}, format: :js }
    end
    it 'update currency in database' do
      currency.reload
      expect(currency.value).to eq 100.0
    end
  end
end
