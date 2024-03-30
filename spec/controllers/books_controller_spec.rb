require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all books as @books' do
      book = Book.create(title: 'Book 1', quantity: 1)
      get :index
      expect(assigns(:books)).to eq([book])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      book = Book.create(title: 'Book 1', quantity: 1)
      get :show, params: { id: book.to_param }
      expect(response).to be_successful
    end
  end
end
