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
    @gig = Gig.create(gig_params)
    if @gig.errors.any?
      render :new
    else
      redirect_to music_director_gig_path(@gig.music_director.id, @gig.id)
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
    @gig.update(gig_params.except(:musician_ids))
    if gig_params[:musician_ids]
      musician_ids = gig_params[:musician_ids].reject! {|id| id == ""}
      musician_ids.each do |id|
        musician = Musician.find(id)
        if @gig.open_instrument_slots.include?(musician.instrument)
          @gig.book_musician(musician)
          flash[:message] = "#{musician.name} has been added to #{@gig.title}!" unless @gig.errors.any?
        end
      end
      @gig.save
    end
    if @gig.errors.any?
      redirect_to edit_music_director_gig_path(@gig.music_director.id, @gig)
    else
      redirect_to music_director_gig_path(@gig.music_director.id, @gig)
    end
  end

  def destroy
    @gig = Gig.find_by(id: params[:id])
    @music_director = @gig.music_director
    @gig.destroy
    redirect_to music_director_path(@music_director)
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :description, :location, :start_date, :end_date, :music_director_id, :genre_id, :budget, instruments_attributes: [:name], instrument_ids: [], musician_ids: [])
  end

end
