class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_is_admin, only: [:show, :edit, :update, :destroy]

  # GET /likes/new
  def new
    @like = Like.new
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to @like.instrument_setup, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @like.instrument_setup }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:instrument_setup_id, :user_id)
    end
end
