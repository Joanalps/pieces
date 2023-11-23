class PiecesController < ApplicationController
  # before_action :set_user, only: %i[new create]
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_piece, only: %i[show edit update destroy]

  def index
    if params[:query].present? && params[:size].present?
      @pieces = Piece.search_and_filter(params[:query]).search_and_filter(params[:size])
    elsif params[:query].present?
      @pieces = Piece.search_and_filter(params[:query])
    elsif params[:size].present?
      @pieces = Piece.search_and_filter(params[:query])
    else
      @pieces = Piece.all
    end
    @piece = Piece.new
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(piece_params)
    @piece.user = current_user
    if @piece.save
      redirect_to piece_path(@piece)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @transaction = Transaction.new
  end


  def edit; end

  def update
    @piece.update(piece_params)
    if @piece.save
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @piece.destroy
    redirect_to pieces_path, status: :see_other
  end

  private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def set_piece
    @piece = Piece.find(params[:id])
  end

  def piece_params
    params.require(:piece).permit(:name, :category, :address, :size, :brand, :color, :description, :tag, :delivery_mode, :price_per_day, photos: [])
  end

end
