class TransactionsController < ApplicationController
  before_action :set_piece

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.piece = @piece
    @transaction.save
    redirect_to piece_path(@piece)
  end

  # def total_price
  #   daily_price = @piece.price_per_day
  #   number_of_days = [:start_date - :end_date]
  # end

  private

  def set_piece
    @piece = Piece.find(params[:piece_id])
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end

end
