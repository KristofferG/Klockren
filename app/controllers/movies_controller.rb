class MoviesController < ApplicationController
  def index
   @movies = Movie.all
  end

  def show
   @movie = Movie.find(params[:id])
  end


  def new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    #render plain: params[:movie].inspect

    title = params[:movie][:title]
    title.to_sym

    require 'net/http'
    require 'json'

    url = 'http://www.omdbapi.com/?t=' + title + '&apikey=2c08f16b'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    obj = JSON.parse(response)

    params[:movie][:title] = obj["Title"]
    params[:movie][:year] = obj["Year"]
    params[:movie][:runtime] = obj["Runtime"]
    params[:movie][:director] = obj["Director"]
    params[:movie][:actors] = obj["Actors"]
    params[:movie][:plot] = obj["Plot"]
    params[:movie][:poster] = obj["Poster"]
    params[:movie][:metascore] = obj["Metascore"]
    params[:movie][:imdb] = obj["imdbRating"]


    #render plain: params[:movie].inspect
    #render plain: obj["Year"]


    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      flash.now[:warning] ='Något blev fel! Försök att ändra titeln, förmodligen hittar den ingen film med exakt den titeln'
      render 'new'
    end

  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end



  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :year, :runtime, :genre, :director, :actors, :plot, :poster, :imdb, :metascore, :user, :comment)
  end

end
