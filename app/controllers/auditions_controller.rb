class AuditionsController < ApplicationController
  
  def create
    @audition = Audition.create(audition_params)
    if @audition.errors.any?
      flash[:message] = "There was an error in creating the audition."
      redirect_to gig_path(@audition.gig)
    else
      redirect_to gig_path(@audition.gig)
    end
  end

  def destroy
    @audition = Audition.find_by(id: params[:id])
    @gig = @audition.gig
    @audition.destroy
    if current_user == @gig.music_director
      redirect_to music_director_gig_path(current_user, @audition.gig)
    else
      redirect_to gig_path(@audition.gig)
    end
  end

  private

  def audition_params
    params.require(:audition).permit(:gig_id, :musician_id)
  end
end
