class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :book_ticket]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  def book_ticket
    @venue = Venue.find(params[:venue_id])
    @seats = @venue.create_seating(@venue.rows,@venue.cols)
    @available = group_booking(params[:count].to_i)
    respond_to do |format|
      format.html {redirect_to @movie, notice: @available}
      format.json { render :nothing =>  true }      
    end  
  end  


  def group_booking(need)
    seats = [] 
    seats_available = []
    count = 0
    @seats["seats"].values.map{|x| seats_available << x[:id] if x[:status] == "AVAILABLE"}
    seats_available.each_with_index do |seat,index|
        col = @seats["seats"][seat][:column]
        if need == 1 && col >= (@venue.cols/2)
            seats << seat
            break
        elsif need != 1 && count < need && col >= (@venue.cols/2)
            count += 1
            seats << seat
        end     
    end
    seats
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :summary, :year, :genre, :imdb_link)
    end
end
