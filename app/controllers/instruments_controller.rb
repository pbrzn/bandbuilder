class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def create
    m_d = params[:music_director_id]
    gig = params[:id]
    @instrument = Instrument.create(instrument_params)
  end

  def show
    @instrument = Instrument.find_by(id: params[:id])
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :musician_id)
  end
end
