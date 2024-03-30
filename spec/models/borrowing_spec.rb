require 'rails_helper'

RSpec.describe Borrowing, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:book) { Book.create(title: 'Book 1', quantity: 2) }

  context 'when creating a new borrowing' do
    it 'validates user borrowing limit' do
      Borrowing.create(user: user, book: book)
      borrowing = Borrowing.new(user: user, book: book)
      borrowing.valid?
      expect(borrowing.errors[:base]).to include('You can only borrow one copy of this book at a time.')
    end

    it 'allows user to borrow if within limit' do
      borrowing = Borrowing.new(user: user, book: book)
      borrowing.valid?
      expect(borrowing.errors[:base]).to be_empty
    end

    it 'prevents user from borrowing more than one copy of a book' do
      Borrowing.create(user: user, book: book)
      borrowing = Borrowing.new(user: user, book: book)
      borrowing.valid?
      expect(borrowing.errors[:base]).to include('You can only borrow one copy of this book at a time.')
    end
  end

  context 'when returning a book' do
    it 'decreases borrowing count' do
      borrowing = Borrowing.create(user: user, book: book)
      expect { borrowing.destroy }.to change { Borrowing.count }.by(-1)
    end
  end
end