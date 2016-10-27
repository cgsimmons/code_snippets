require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do
  describe '#new' do
    it 'it renders new page' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'sets snippet instance variable' do
      get :new
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end
  end

  describe '#show' do
    it 'renders the show template' do
      snippet = create(:snippet)
      get :show, params: { id: snippet.id }
      expect(response).to render_template(:show)
    end
    it 'sets an instance variable with the product whose id is passed' do
      snippet = create(:snippet)
      get :show, params: { id: snippet.id }
      expect(assigns(:snippet)).to eq(snippet)
    end
  end

  describe '#create' do
    let(:kind){create(:kind)}
    context 'with a valid request'do
      def valid_request
        post :create, params: {snippet: attributes_for(:snippet, kind_id: kind.id)}
      end

      it 'adds snippet to the DB' do
        count_before = Snippet.all.count
        valid_request
        count_after = Snippet.all.count
        expect(count_after).to eq(count_before+1)
      end

      it 'redirects to show snippet' do
        valid_request
        expect(response).to redirect_to(snippet_path(Snippet.last))
      end

    end
    def invalid_request
      post :create, params: {snippet: attributes_for(:snippet, title: nil, kind_id: kind.id)}
    end
    context 'without a valid request' do
      it 'doesn\t add snippet to the DB' do
        count_before = Snippet.count
        invalid_request
        count_after = Snippet.count
        expect(count_after).to eq(count_before)
      end
      it 'renders new' do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end
end
