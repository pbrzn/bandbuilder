class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create!(genre_params)
    if @genre.errors.any?
      redirect_to new_genre_path
    else
      redirect_to genre_path(@genre)
    end
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :gig_id)
  end
end
