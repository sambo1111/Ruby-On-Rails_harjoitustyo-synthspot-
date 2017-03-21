class InstrumentSetupsController < ApplicationController
  before_action :set_instrument_setup, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, only: [:new, :create, :destroy]

  # GET /instrument_setups
  # GET /instrument_setups.json
  def index
    @instrument_setups = InstrumentSetup.all
  end

  # GET /instrument_setups/1
  # GET /instrument_setups/1.json
  def show
    @setup_instrument = SetupInstrument.new
    @setup_instrument.instrument_setup = @instrument_setup
    @instruments = Instrument.all
  end

  # GET /instrument_setups/new
  def new
    @instrument_setup = InstrumentSetup.new
  end

  # GET /instrument_setups/1/edit
  def edit
  end

  # POST /instrument_setups
  # POST /instrument_setups.json
  def create
    @instrument_setup = InstrumentSetup.new(instrument_setup_params)
    @instrument_setup.user_id = current_user.id if current_user

    respond_to do |format|
      if current_user and @instrument_setup.save
        format.html { redirect_to @instrument_setup, notice: 'Instrument setup was successfully created.' }
        format.json { render :show, status: :created, location: @instrument_setup }
      else
        format.html { render :new }
        format.json { render json: @instrument_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instrument_setups/1
  # PATCH/PUT /instrument_setups/1.json
  def update
    respond_to do |format|
      if @instrument_setup.update(instrument_setup_params)
        format.html { redirect_to @instrument_setup, notice: 'Instrument setup was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrument_setup }
      else
        format.html { render :edit }
        format.json { render json: @instrument_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrument_setups/1
  # DELETE /instrument_setups/1.json
  def destroy
    @instrument_setup.setup_instruments.each do |inst| inst.destroy end
    @instrument_setup.destroy
    respond_to do |format|
      format.html { redirect_to instrument_setups_url, notice: 'Instrument setup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument_setup
      @instrument_setup = InstrumentSetup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_setup_params
      params.require(:instrument_setup).permit(:name, :info, :user_id)
    end
end
