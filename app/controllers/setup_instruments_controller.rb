class SetupInstrumentsController < ApplicationController
  before_action :set_setup_instrument, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, only: [:new, :create, :destroy]

  # GET /setup_instruments/1
  # GET /setup_instruments/1.json
  def show
  end

  # GET /setup_instruments/new
  def new
    @setup_instrument = SetupInstrument.new
  end

  # POST /setup_instruments
  # POST /setup_instruments.json
  def create
    @setup_instrument = SetupInstrument.new(setup_instrument_params)

    respond_to do |format|
      if @setup_instrument.instrument_setup.instruments.exclude? @setup_instrument.instrument and @setup_instrument.save
        format.html { redirect_to @setup_instrument.instrument_setup, notice: 'Setup instrument was successfully created.' }
        format.json { render :show, status: :created, location: @setup_instrument.instrument_setup }
      else
        format.html { redirect_to @setup_instrument.instrument_setup }
        format.json { render json: @setup_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setup_instruments/1
  # DELETE /setup_instruments/1.json
  def destroy
    @instrument_setup = @setup_instrument.instrument_setup
    @setup_instrument.destroy
    respond_to do |format|
      format.html { redirect_to @instrument_setup, notice: 'Setup instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setup_instrument
      @setup_instrument = SetupInstrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setup_instrument_params
      params.require(:setup_instrument).permit(:instrument_setup_id, :instrument_id)
    end
end
