class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
    @instruments = Instrument.all
  end

  def show
    @musician = Musician.find_by(id: params[:id])
  end

  def edit
    @musician = Musician.find_by(id: params[:id])
  end

  def update
    @musician = Musician.find_by(id: params[:id])
    if logged_in? && @musician == current_user
      @musician.update(musician_params)
    end
    if @musician.errors.any?
      @errors = @musician.errors
      render :edit
    else
      redirect_to musician_path(@musician)
    end
  end

  private

  def musician_params
    params.require(:musician).permit(:name, :bio, :instrument_id, :pay_rate, instrument_attributes: [:name])
  end
end
