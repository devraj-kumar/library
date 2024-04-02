require 'rails_helper'

RSpec.describe BorrowingsController, type: :controller do
  let(:user) { create(:user, name: 'John Doe') }
  let(:book) { create(:book, title: 'Book 1', quantity: 2) }
  let(:book2) { create(:book, title: 'Book 2', quantity: 1) }
  let(:book3) { create(:book, title: 'Book 3', quantity: 1) }

  describe 'POST #create' do
    context 'when borrowing a single book' do

      it 'creates a new borrowing' do
        post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
        expect(Borrowing.count).to eq(1)
      end
    end

    context 'when trying to borrow multiple copies of the same book' do

      it 'creates only one borrowing' do
        post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
        post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
        expect(Borrowing.count).to eq(1)
      end
    end

    context 'when trying to borrow different books' do
      it 'creates multiple borrowings' do
        post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
        post :create, params: { borrowing: { user_id: user.id, book_id: book2.id } }
        expect(Borrowing.count).to eq(2)
      end
    end

    context 'when trying to borrow more than 2 different books' do
      it 'creates only two borrowings' do
        post :create, params: { borrowing: { user_id: user.id, book_id: book.id } }
        post :create, params: { borrowing: { user_id: user.id, book_id: book2.id } }
        post :create, params: { borrowing: { user_id: user.id, book_id: book3.id } }
        expect(Borrowing.count).to eq(2)
      end
    end
  end
end
