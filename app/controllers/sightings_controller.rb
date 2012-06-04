class SightingsController < ApplicationController
  skip_before_filter :authorize, :except => [:edit, :destroy]
  
  # railscasts.com #228 Sortable Table Columns
  helper_method :sort_column, :sort_direction
  
  # GET /sightings
  # GET /sightings.json
  def index
    if Sighting.count == 0
      Sighting.import
    end

    if params[:search]
      @sightings = Sighting.search(params[:search])
    else
      @sightings = Sighting.order(sort_column + " " + sort_direction)
      # see sortable in application_helper.rb
    end
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sightings }
      end
  end

  # GET /sightings/1
  # GET /sightings/1.json
  def show
    @sighting = Sighting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sighting }
    end
  end

  # GET /sightings/new
  # GET /sightings/new.json
  def new
    @sighting = Sighting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sighting }
    end
  end

  # GET /sightings/1/edit
  def edit
    @sighting = Sighting.find(params[:id])
  end

  # POST /sightings
  # POST /sightings.json
  def create
    @sighting = Sighting.new(params[:sighting])

    respond_to do |format|
      if @sighting.save
        format.html { redirect_to @sighting, notice: 'Sighting was successfully created.' }
        format.json { render json: @sighting, status: :created, location: @sighting }
      else
        format.html { render action: "new" }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sightings/1
  # PUT /sightings/1.json
  def update
    @sighting = Sighting.find(params[:id])

    respond_to do |format|
      if @sighting.update_attributes(params[:sighting])
        format.html { redirect_to @sighting, notice: 'Sighting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sightings/1
  # DELETE /sightings/1.json
  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy

    respond_to do |format|
      format.html { redirect_to sightings_url }
      format.json { head :no_content }
    end
  end

  # railscasts.com #228 Sortable Column Names
  private
  
  def sort_column
    Sighting.column_names.include?(params[:sort]) ? params[:sort] : "tag"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
