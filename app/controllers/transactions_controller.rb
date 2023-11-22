class TransactionsController < ApplicationController
  before_action :set_piece

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.piece = @piece
    @transaction.user = current_user
    if @transaction.start_date == @transaction.end_date
      @transaction.total_price = @piece.price_per_day
    else
      @transaction.total_price = (@piece.price_per_day * (@transaction.end_date - @transaction.start_date))
    end
    @transaction.status = "pending"
    if @transaction.save
      redirect_to piece_path(@piece) #profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_piece
    @piece = Piece.find(params[:piece_id])
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end

end
