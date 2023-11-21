class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @pieces = @user.pieces
    @transactions = @user.transactions
    @owner_transactions = Transaction.where(piece: @pieces)
  end
end
