class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_is_admin, only: [:new, :create, :edit, :destroy, :update]

  # GET /instruments
  # GET /instruments.json
  def index
    if params[:search_instrument]
      @instruments = Instrument.search(params[:search_instrument])
    else
      @instruments = Instrument.all
    end
  end

  # GET /instruments/1
  # GET /instruments/1.json
  def show
    session[:keyword] = @instrument.name
    session[:instrument_to_be_reviewed] = params[:id]
  end

  # GET /instruments/new
  def new
    @types = Type.all
    @manufacturers = Manufacturer.all
    @instrument = Instrument.new
  end

  # GET /instruments/1/edit
  def edit
    @types = Type.all
    @manufacturers = Manufacturer.all
  end

  # POST /instruments
  # POST /instruments.json
  def create
    @types = Type.all
    @manufacturers = Manufacturer.all
    @instrument = Instrument.new(instrument_params)

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, notice: 'Instrument was successfully created.' }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruments/1
  # PATCH/PUT /instruments/1.json
  def update
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to @instrument, notice: 'Instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruments/1
  # DELETE /instruments/1.json
  def destroy
    @instrument.setup_instruments.each do |inst| inst.destroy end
    @instrument.user_instruments.each do |inst| inst.destroy end
    @instrument.destroy
    respond_to do |format|
      format.html { redirect_to instruments_url, notice: 'Instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.require(:instrument).permit(:name, :year, :info, :manufacturer_id, :type_id, :image_link)
    end
end
