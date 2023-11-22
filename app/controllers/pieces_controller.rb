class PiecesController < ApplicationController
  # before_action :set_user, only: %i[new create]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pieces = Piece.all
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
    @piece = Piece.find(params[:id])
  end

  def edit
    @piece = Piece.find(params[:id])
  end

  def update
    @piece = Piece.find(params[:id])
    @piece.update(piece_params)
    redirect_to piece_path(@piece)
  end

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy
    redirect_to profile_path, status: :see_other
  end


  private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def piece_params
    params.require(:piece).permit(:name, :category, :address, :size, :brand, :color, :description, :tag, :delivery_mode,      :price_per_day)
  end

end
