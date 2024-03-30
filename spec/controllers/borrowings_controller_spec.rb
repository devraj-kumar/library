require 'rails_helper'

RSpec.describe BorrowingsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new borrowing' do
      user = User.create(name: 'John Doe')
      book = Book.create(title: 'Book 1', quantity: 1)
      post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
      expect(Borrowing.count).to eq(1)
    end
  end
end
