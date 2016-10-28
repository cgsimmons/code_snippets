require 'rails_helper'

RSpec.describe SnippetListsController, type: :controller do
  describe '#index' do
    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'sets instance variable snippets' do
      get :index
      expect(assigns(:snippets)).to be
    end
  end

  describe '#show' do
    def valid_request
      lang = create :language
      get :show, params: {id: lang.id}
    end
    it 'sets instance variable language' do
      valid_request
      expect(assigns(:snippets)).to be
    end
    it 'sets instance variable snippets' do
      valid_request
      expect(assigns(:language)).to be
    end
    it 'renders show' do
      valid_request
      expect(response).to render_template(:show)
    end
  end

end
