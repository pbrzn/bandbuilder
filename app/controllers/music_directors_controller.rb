class MusicDirectorsController < ApplicationController
  def index
    @music_directors = MusicDirector.all
  end

  def show
    @music_director = MusicDirector.find_by(id: params[:id])
  end
end
