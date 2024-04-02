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

  describe 'POST #create' do
    it 'tries to create multiple borring of same book' do
      user = User.create(name: 'John Doe')
      book = Book.create(title: 'Book 1', quantity: 2)
      post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
      post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
      expect(Borrowing.count).to eq(1)
    end
  end

  describe 'POST #create' do
    it 'tries to create multiple borring of different book' do
      user = User.create(name: 'John Doe')
      book = Book.create(title: 'Book 1', quantity: 1)
      book2 = Book.create(title: 'Book 2', quantity: 1)
      post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
      post :create, params: { borrowing: { user_id: user.id, book_id: book2.id } }
      expect(Borrowing.count).to eq(2)
    end
  end

  describe 'POST #create' do
    it 'tries to create more than 2 borring of different book' do
      user = User.create(name: 'John Doe')
      book = Book.create(title: 'Book 1', quantity: 1)
      book2 = Book.create(title: 'Book 2', quantity: 1)
      book3 = Book.create(title: 'Book 3', quantity: 1)
      post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
      post :create, params: { borrowing: { user_id: user.id, book_id: book2.id } }
      post :create, params: { borrowing: { user_id: user.id, book_id: book3.id } }
      expect(Borrowing.count).to eq(2)
    end
  end
end
