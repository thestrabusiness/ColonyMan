class MouseRacks::MatingCagesController < ApplicationController
  before_action :set_mating_cage, only: [:show, :edit, :update, :destroy]


  def index
    @mating_cages = MatingCage.all
  end

  def show
    @mouse_rack = @mating_cage.mouse_rack
    @mice = Mouse.where(mating_cage_id: @mating_cage.id)
  end

  def new
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
    @mating_cage = MatingCage.new  
  end

  def edit
  end

  def create
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
    @mating_cage = MatingCage.new(mating_cage_params)
    @mating_cage.mouse_rack_id = @mouse_rack.id
    @mating_cage.slotable_type = "Slot"

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
      params.require(:mating_cage).permit(:cage_id, :mated, :strain1, :strain2, :slotable_id)
    end
end
