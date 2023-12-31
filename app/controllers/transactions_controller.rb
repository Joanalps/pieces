class TransactionsController < ApplicationController
  before_action :set_piece, only: %i[create new]

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
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def accept
    @transaction = Transaction.find(params[:id])
    @transaction.status = "accepted"
    @transaction.save
    # @transaction.update(status: "accept")
    redirect_to profile_path
  end

  def reject
    @transaction = Transaction.find(params[:id])
    @transaction.status = "rejected"
    @transaction.save
    redirect_to profile_path
  end

  private

  def set_piece
    @piece = Piece.find(params[:piece_id])
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end

  def edit
  end

  def destroy
  end
end
