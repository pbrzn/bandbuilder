class MusicDirectorsController < ApplicationController
  def index
    @music_directors = MusicDirector.all
  end

  def show
    @music_director = MusicDirector.find_by(id: params[:id])
  end

  def edit
    @music_director = MusicDirector.find_by(id: params[:id])
  end

  def update
    @music_director = MusicDirector.find_by(id: params[:id])
    if logged_in? && @music_director == current_user
      @music_director.update(music_director_params)
    end
    if @music_director.errors.any?
      @errors = @music_director.errors
      render :edit
    else
      redirect_to music_director_path(@music_director)
    end
  end

  private

  def music_director_params
    params.require(:music_director).permit(:name, :bio, :instrument_id, :pay_rate, instrument_attributes: [:name])
  end
end
