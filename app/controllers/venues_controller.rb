class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  
  def new
    @venue = Venue.new
  end

  def edit
  end  

  def index
    @venues = Venue.all
  end

  def get_layout
    @venue = Venue.find(params[:venue])
    data = @venue.create_seating(@venue.rows,@venue.cols)
    respond_to do |format|
      format.json { render json: data.to_json }
    end
  end  

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to venues_path, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def create
    @venue = Venue.new(venue_params)
    respond_to do |format|
      if @venue.save
        format.html { redirect_to venues_path, notice: 'venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue      
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :cols, :rows)
    end

end
