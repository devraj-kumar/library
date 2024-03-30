require 'rails_helper'

RSpec.describe 'Viewing books in the library', type: :feature do

  it 'shows the list of books when there are books in the library' do
    Book.create(title: 'Book 1', quantity: 1)
    Book.create(title: 'Book 2', quantity: 1)

    visit books_path
    expect(page).to have_content('Book 1')
    expect(page).to have_content('Book 2')
  end
end
