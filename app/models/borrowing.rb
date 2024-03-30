class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :user_borrowing_limit, on: :create
  validate :user_can_borrow_one_copy_at_a_time, on: :create

  private

  def user_borrowing_limit
    errors.add(:base, 'User has reached the borrowing limit') if user.borrowings.count >= 2
  end

  def user_can_borrow_one_copy_at_a_time
    if user.borrowings.where(book_id: book_id).exists?
      errors.add(:base, 'You can only borrow one copy of this book at a time.')
    end
  end

end