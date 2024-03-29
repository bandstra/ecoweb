class OrganismsController < ApplicationController
  skip_before_filter :authorize, :except => [:create, :edit, :update, :destroy]
  
  require 'csv'

  def import
    CSV.open('import/organisms.csv', 'r').each do |row|
      Organism.create(:common_name => row[1])
    end
  end
  
  # GET /organisms
  # GET /organisms.json
  def index
    @organisms = Organism.all

    if @organisms.empty?
      import
    else 
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @organisms }
      end
    end
  end

  # GET /organisms/1
  # GET /organisms/1.json
  def show
    @organism = Organism.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organism }
    end
  end

  # GET /organisms/new
  # GET /organisms/new.json
  def new
    @organism = Organism.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organism }
    end
  end

  # GET /organisms/1/edit
  def edit
    @organism = Organism.find(params[:id])
  end

  # POST /organisms
  # POST /organisms.json
  def create
    @organism = Organism.new(params[:organism])

    respond_to do |format|
      if @organism.save
        format.html { redirect_to @organism, notice: 'Organism was successfully created.' }
        format.json { render json: @organism, status: :created, location: @organism }
      else
        format.html { render action: "new" }
        format.json { render json: @organism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organisms/1
  # PUT /organisms/1.json
  def update
    @organism = Organism.find(params[:id])

    respond_to do |format|
      if @organism.update_attributes(params[:organism])
        format.html { redirect_to @organism, notice: 'Organism was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisms/1
  # DELETE /organisms/1.json
  def destroy
    @organism = Organism.find(params[:id])
    @organism.destroy

    respond_to do |format|
      format.html { redirect_to organisms_url }
      format.json { head :no_content }
    end
  end
end
