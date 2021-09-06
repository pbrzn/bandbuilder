class GigsController < ApplicationController
  def index
    if params[:music_director_id]
      @gigs = MusicDirector.find(params[:music_director_id]).gigs
    elsif params[:musician_id]
      @gigs = Musician.find(params[:musician_id]).gigs
    else
      @gigs = Gig.all
    end
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.create!(gig_params)
    if @gig.errors.any?
      # @errors = @gig.errors
      redirect_to new_music_director_gig_path
    else
      redirect_to music_director_gig_path(@gig)
    end
  end

  def show
    @gig = Gig.find_by(id: params[:id])
  end

  def edit
    @gig = Gig.find_by(id: params[:id])
  end

  def update
    @gig = Gig.find_by(id: params[:id])
    @gig.update!(gig_params)
    if @gig.errors.any?
      # @errors = @gig.errors
      redirect_to edit_music_director_gig_path(@gig)
    else
      redirect_to music_director_gig_path(@gig)
    end
  end

  def destroy
    @gig = Gig.find_by(id: params[:id])
    @gig.destroy
    redirect_to login_path
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :description, :location, :start_date, :end_date, :music_director_id, :genre_id, :budget, instrument_ids: [], :instrument_attributes)
  end

end
