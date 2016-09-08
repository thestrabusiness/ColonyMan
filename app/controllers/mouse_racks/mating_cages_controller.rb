class MouseRacks::MatingCagesController < ApplicationController
  before_action :set_mating_cage, only: [:show, :edit, :update, :destroy]

  # GET /mating_cages
  # GET /mating_cages.json
  def index
    @mating_cages = MatingCage.all
  end

  # GET /mating_cages/1
  # GET /mating_cages/1.json
  def show
  end

  # GET /mating_cages/new
  def new
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
    @mating_cage = MatingCage.new   
  end

  # GET /mating_cages/1/edit
  def edit
  end

  # POST /mating_cages
  # POST /mating_cages.json
  def create
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
    @mating_cage = MatingCage.new(mating_cage_params)
    @mating_cage.mouse_rack_id = @mouse_rack.id

    respond_to do |format|
      if @mating_cage.save
        format.html { redirect_to @mating_cage, notice: 'Mating cage was successfully created.' }
        format.json { render :show, status: :created, location: @mating_cage }
      else
        format.html { render :new }
        format.json { render json: @mating_cage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mating_cages/1
  # PATCH/PUT /mating_cages/1.json
  def update
    respond_to do |format|
      if @mating_cage.update(mating_cage_params)
        format.html { redirect_to @mating_cage, notice: 'Mating cage was successfully updated.' }
        format.json { render :show, status: :ok, location: @mating_cage }
      else
        format.html { render :edit }
        format.json { render json: @mating_cage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mating_cages/1
  # DELETE /mating_cages/1.json
  def destroy
    @mating_cage.destroy
    respond_to do |format|
      format.html { redirect_to mating_cages_url, notice: 'Mating cage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mating_cage
      @mating_cage = MatingCage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mating_cage_params
      params.require(:mating_cage).permit(:cage_id, :mated, :strain1, :strain2)
    end
end
