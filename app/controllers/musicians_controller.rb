class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
    @instruments = Instrument.all
  end

  def show
    @musician = Musician.find_by(id: params[:id])
  end
end
