class UserInstrumentsController < ApplicationController
  before_action :set_user_instrument, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, except: [:index, :show]

  # GET /user_instruments
  # GET /user_instruments.json
  def index
    @user_instruments = UserInstrument.all
  end

  # GET /user_instruments/1
  # GET /user_instruments/1.json
  def show
  end

  # GET /user_instruments/new
  def new
    @instruments = Instrument.all
    @user_instrument = UserInstrument.new
  end

  # GET /user_instruments/1/edit
  def edit
  end

  # POST /user_instruments
  # POST /user_instruments.json
  def create
    @user_instrument = UserInstrument.new(user_instrument_params)
    @user_instrument.user_id = current_user.id if current_user

    respond_to do |format|
      if current_user and @user_instrument.save
        current_user.user_instruments << @user_instrument
        format.html { redirect_to current_user, notice: 'User instrument was successfully created.' }
        format.json { render :show, status: :created, location: @user_instrument }
      else
        format.html { render :new }
        format.json { render json: @user_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_instruments/1
  # PATCH/PUT /user_instruments/1.json
  def update
    respond_to do |format|
      if @user_instrument.update(user_instrument_params)
        format.html { redirect_to @user_instrument, notice: 'User instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_instrument }
      else
        format.html { render :edit }
        format.json { render json: @user_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_instruments/1
  # DELETE /user_instruments/1.json
  def destroy
    @user_instrument.destroy
    respond_to do |format|
      format.html { redirect_to user_instruments_url, notice: 'User instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_instrument
      @user_instrument = UserInstrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_instrument_params
      params.require(:user_instrument).permit(:user_id, :instrument_id)
    end
end
