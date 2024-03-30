class BorrowingsController < ApplicationController
  before_action :set_borrowing, only: [:show, :edit, :update, :return_book]

  # GET /borrowings
  def index
    @borrowings = Borrowing.all
  end

  # GET /borrowings/1
  def show
  end

  # GET /borrowings/new
  def new
    @borrowing = Borrowing.new
  end

  # GET /borrowings/1/edit
  def edit
  end

  # POST /borrowings
  def create
    @borrowing = Borrowing.new(borrowing_params)

    if @borrowing.save
      redirect_to @borrowing, notice: 'Borrowing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /borrowings/1
  def update
    if @borrowing.update(borrowing_params)
      redirect_to @borrowing, notice: 'Borrowing was successfully updated.'
    else
      render :edit
    end
  end

  def return_book
    if @borrowing.nil?
      redirect_to borrowings_url, alert: 'Borrowing not found.'
    else
      @borrowing.destroy
      redirect_to borrowings_url, notice: 'Book returned successfully.'
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowing
      @borrowing = Borrowing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrowing_params
      params.require(:borrowing).permit(:user_id, :book_id)
    end
end
