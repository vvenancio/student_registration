require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe '#index' do
    before { get :index }

    context 'with view' do
      render_views

      it 'renders index' do
        expect(response).to render_template(:index)
      end
    end
  end
end
