class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  # def new
  #   @instrument = Instrument.new
  # end

  def create
    @instrument = Instrument.create!(instrument_params)
    if @instrument.errors.any?
      redirect_to new_instrument_path
    else
      redirecto_to instrument_path(@instrument)
    end
  end

  def show
    @instrument = Instrument.find_by(id: params[:id])
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :musician_id)
  end
end
